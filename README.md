# FormNetworkModule

[![License](https://img.shields.io/cocoapods/l/SwiftString.svg?style=flat)](http://cocoapods.org/pods/SwiftString)
[![Platform](https://img.shields.io/cocoapods/p/SwiftString.svg?style=flat)](http://cocoapods.org/pods/SwiftString)
[![Swift-5.0](http://img.shields.io/badge/Swift-5.0-blue.svg)]()

## Easy URLSession Networking and testing by Form File

## 

### Concept

You can create a network module that is easier to test by injecting a form file specified with FormConvertible Protocol.



![Diagram](/Users/Sangmin/Downloads/Diagram.jpg)



### Form

This file contains network elements with EndPoint. Injecting a form facilitates unit testing and enables a regulated network within the project.

~~~swift
enum LottoForm: FormConvertible {
                            
    case lottoNumber(roundNumber: Int)
}

extension LottoForm {
    
    
    var baseURL: URL {
        guard let url = URL(string: BaseURL.lotto.rawValue) else { fatalError("Invalid URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .lottoNumber(let roundNumber):
            return "common.do?method=getLottoNumber&drwNo=\(roundNumber)"
        }
    }
    
    var url: URL {
        switch self {
        case .lottoNumber(_):
            var URL = baseURL
            URL.appendPathComponent(path)
            return URL
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .lottoNumber(_):
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
    
    var parameter: [String : Any]? {
        return nil
    }
}
~~~



### Session

It plays the role of the Network Session stage and is responsible for task execution and cancellation.

### RequestSender

It plays the role of the Network Presentation stage, and models the information received through the Session through Json Decoder.

### Adater

Adater directly connects Client and Network Module.

### Service

It is owned by the client and becomes an object that directly injects form files.

~~~swift
        
    func fetchLottoNumber(_ number: Int,
                          success: @escaping LottoSuccess,
                          failture: @escaping FailHandler) {
        adapter.fetch(LottoForm.lottoNumber(roundNumber: number)) { (result: Result<Lotto, Error>) in
            switch result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failture(error)
            }
        }
    }
    
    func stopRequest() {
        adapter.stop()
    }
    
    func suspendRequest() {
        adapter.suspend()
    }
    
    private var adapter = Adpater()
    
    typealias LottoSuccess = (Lotto) -> Void
    
    typealias FailHandler = (Error) -> Void
~~~



### Example

~~~swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = LottoService()
        service.fetchLottoNumber(905) { (lotto) in
            print(lotto.description)
        } failture: { (error) in
            print(error.localizedDescription)
        }
    }
}

~~~



### TO DO

* Inversion by Service Protocol
* Modularization of parameters for each method

## Author

CheckShirt, yeehaw@live.co.kr



## License

FormNetworkModule  is available under the MIT license. See the LICENSE file for more info.