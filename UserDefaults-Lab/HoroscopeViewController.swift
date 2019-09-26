
import UIKit

class HoroscopeViewController: UIViewController {
    @IBOutlet var horoscopeSign: UILabel!
    @IBOutlet var horoscopeDate: UILabel!
    @IBOutlet var horsocopeDetail: UITextView!
    
    var date:String!
    var horoscope:Horoscope!{
        didSet{
        setupHoroscopeVC()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    getData()
        
    }
    
   private func getData(){
        HoroscopeAPIClient.shared.getData(horoscope: "pisces") { (result) in
            DispatchQueue.main.async {
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let horoscope):
                    self.horoscope = horoscope
                }
            }
        }
    }
    
   private func setupHoroscopeVC(){
        horoscopeDate.text = horoscope.date
        horoscopeSign.text = horoscope.sunsign
        horsocopeDetail.text = horoscope.horoscope
    }
    
}

