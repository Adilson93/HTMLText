//
//  ViewController.swift
//  HTMLText
//
//  Created by Adilson Ebo on 13/10/2021.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    let html = "<div class=\"ExternalClass19CEBA7067E147819C36AB7DC16EB5C5\"><span id=\"ms-rterangepaste-start\"></span><div style=\"box-sizing&#58;border-box;color&#58;rgb(51, 51, 51);font-family&#58;&quot;trebuchet ms&quot;;background-color&#58;rgb(255, 255, 255);text-align&#58;justify;\">Considerando que os Bancos Comerciais devem assegurar aos seus clientes, em todas as actividades que exercem, níveis adequados de qualidade de serviço, incluindo o acesso aos recursos depositados, o Banco Nacional Angola institui procedimentos complementares relativos à disponibilização do canal Caixa Automático da Rede Multicaixa e horário de atendimento em períodos de elevada concentração de depositantes na rede bancária.</div><p style=\"box-sizing&#58;border-box;margin-bottom&#58;9px;color&#58;rgb(51, 51, 51);font-family&#58;&quot;trebuchet ms&quot;;background-color&#58;rgb(255, 255, 255);\"></p><div class=\"X-section\" style=\"box-sizing&#58;border-box;color&#58;rgb(51, 51, 51);font-family&#58;&quot;trebuchet ms&quot;;background-color&#58;rgb(255, 255, 255);\"><h4 style=\"box-sizing&#58;border-box;font-family&#58;inherit;line-height&#58;1.42857;color&#58;rgb(154, 125, 63);margin-top&#58;30px;margin-bottom&#58;9px;font-size&#58;1.6em;\"></h4>Para aceder à Directiva n.º 09/DSP/DCF/2021 clique&#160;<a href=\"https://www.youtube.com/watch?v=MRKLggeJqLA&ab_channel=SwiftTutorials\" style=\"box-sizing&#58;border-box;background-color&#58;transparent;color&#58;rgb(34, 87, 117);\">aqui</a>​<br></div><span id=\"ms-rterangepaste-end\"></span><span id=\"ms-rterangecursor-start\"></span><span id=\"ms-rterangecursor-end\"></span><br></div>"
    
    let link = "https://www.youtube.com/watch?v=DBWu6TnhLeY&ab_channel=SeanAllen"
    let linkIMG =  "<html><body><h1>This is the title</h1><p>This is the first paragraph.</p><img src=\"https://static.mundoeducacao.uol.com.br/mundoeducacao/2021/05/manga.jpg\" width=\"360\" height=\"240\"><p>This is the second paragraph.</p><p>This is the third paragraph.</p><p>This is the fourth paragraph.</p><p>This is the last paragraph.</p></body></html>"

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.attributedText = linkIMG.convertToAttributedFromHTML()
        
        
        textview.delegate = self
        textview.isUserInteractionEnabled = true // default: true
        textview.isEditable = false // default: true
        textview.isSelectable = true // default: true
        textview.dataDetectorTypes = [.link]
        
        textview.attributedText = linkIMG.convertToAttributedFromHTML()
    }


}



extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
    
    
    func convertHtml() -> NSAttributedString{
           guard let data = data(using: .utf8) else { return NSAttributedString() }
           do{
               return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
           }catch{
               return NSAttributedString()
           }
       }
    
    
    func convertToAttributedFromHTML() -> NSAttributedString? {
            var attributedText: NSAttributedString?
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
            if let data = data(using: .unicode, allowLossyConversion: true), let attrStr = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
                attributedText = attrStr
            }
            return attributedText
        }
}
