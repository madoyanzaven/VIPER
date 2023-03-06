# Bils
A sample app which utilizes [the endpoint](https://bills.chipp.dev/all) to display bill list. 
### Architecture
*VIPER (View-Interactor-Presenter-Entity-Router) + Coordinator

### Built With
* Swift, RxSwift, UIKit + UI as code
* Network - URLSession, JSONDecoder
* Tests - XCTestCase

### Good practices followed
* Single responsibility of solid principle
* Dependency inversion principle
* DRY principles
* Clean architecture

### If future-proof
In the project all layers are abstract, which allows to organize dependency flow, it is also easier for testing and preferable for scalable applications.

### Additional info
For choosing 3 screen you just need change Scheme of app.
Bills - for getting all list(Screen1),
BillsEmpty - for showing empty screen(Screen2)
BillsError - for showing error screen(Screen3)

### Time it took
It took a full development day, development process was without stresses.
