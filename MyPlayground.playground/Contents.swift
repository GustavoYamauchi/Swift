import UIKit
import PlaygroundSupport


class MinhaLabel : UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        desenharLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        desenharLabel()
    }
    
    private func desenharLabel(){
        backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        font = UIFont.boldSystemFont(ofSize:  25.0)
    }
}

class MeuBtn : UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        desenharBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        desenharBtn()
    }
    
    private func desenharBtn(){
        backgroundColor = .init(red:0.3, green:0.3, blue: 0.3, alpha: 1.0)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25.0)
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.darkGray.cgColor
    }

}

class testeViewController : UIViewController //Controller -> Controla a view
{
    var label : MinhaLabel!; //Declara Label
    
//    static var label : UILabel? = UILabel()
    var btnV : MeuBtn!;
    var btnM : MeuBtn!;
    var btnInicio : MeuBtn!;

    
    let perguntas = ["Comeco", "1 - Pergunta1", "2 - Pergunta2", "3 - Pergunta3", "4 - Pergunta4", "5 - Pergunta5", "6 - Pergunta6", "Fim"]
    let respostasCorretas = [3, 1, 1, 1, 1, 1, 1, 1]
    
    var perguntaIndex = 0;
    
    
    override func loadView() { //Sobrescreve método loadView() -> Dispara quando a view é carregada
        let view = UIView();     //Instancia view
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1);
        view.layer.borderColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20//Set a cor de fundo
        
            
        label = MinhaLabel()          //Instacia Label
        label.text = perguntas[perguntaIndex];     //Set texto
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);   //Set cor do texto
        label.textAlignment = .center
//        salabel.isHidden = true
        
        view.addSubview(label);     //Adiciono a label na view
        
        //config botao de Verdade
        btnV = MeuBtn()
        btnV.setTitle("Verdade", for: .normal);
        btnV.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnV.tag = 1
        btnV.backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1);
        btnV.isHidden = true
        view.addSubview(btnV)
        
        //config botao de Mentira
        btnM = MeuBtn()
        btnM.setTitle("Mentira", for: .normal);
        btnM.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnM.tag = 0
        btnM.backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1);
        btnM.isHidden = true
        view.addSubview(btnM)

        //config botao de Inicio
        btnInicio = MeuBtn()
        btnInicio.setTitle("Inicio", for: .normal);
        btnInicio.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnInicio.tag = 3
        btnInicio.backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1);
        btnInicio.isHidden = false
        view.addSubview(btnInicio)


        //Autoresinzing
        label.translatesAutoresizingMaskIntoConstraints = false;   //
        btnV.translatesAutoresizingMaskIntoConstraints  = false;
        btnM.translatesAutoresizingMaskIntoConstraints  = false;
        btnInicio.translatesAutoresizingMaskIntoConstraints = false;

        
        let margins = view.layoutMarginsGuide; //Pego os valores de margem do sistema (tela)
              
        NSLayoutConstraint.activate([    //Funçao que aparentemente define o local dos objetos na tela
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 5),    //Define os valores da posição do eixo X
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor,constant: -5),//Define os valores da posição do eixo X
            label.topAnchor.constraint(equalTo:margins.topAnchor,constant: 25),     //Define os valores da posição do eixo Y
            label.heightAnchor.constraint(equalToConstant: 300),
            label.widthAnchor.constraint(equalToConstant: 10),
            
            btnV.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 5),    //Define os valores da posição do eixo X
            btnV.topAnchor.constraint(equalTo:margins.centerYAnchor, constant: 60), //Define os valores da posição do eixo Y
            btnV.trailingAnchor.constraint(equalTo: margins.centerXAnchor, constant: -5),
            btnV.heightAnchor.constraint(equalToConstant: 200),
            
            btnM.leadingAnchor.constraint(equalTo: margins.centerXAnchor, constant: 5),    //Define os valores da posição do eixo X
            btnM.topAnchor.constraint(equalTo:margins.centerYAnchor, constant: 60),     //Define os valores da posição do eixo Y
            btnM.widthAnchor.constraint(equalToConstant: 150),
            btnM.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            btnM.heightAnchor.constraint(equalToConstant: 200),
            
            
            
            btnInicio.topAnchor.constraint(equalTo: margins.topAnchor, constant: 500),
            btnInicio.heightAnchor.constraint(equalToConstant: 50),
            btnInicio.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
        
        ])
        btnV.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        btnM.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        btnInicio.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        
        self.view = view;  //Define a view como a view principal
    }
    
    @objc func verificar(sender: UIButton) {
        
        
        
        if (respostasCorretas[perguntaIndex] == sender.tag) {
            correta(sender: sender);
        }
        else{
            incorreta();
        }
    }
    
    @objc func prox(sender: UIButton){
        perguntaIndex += 1;
        
        print(perguntaIndex)
        if (sender.tag == 3){
            btnM.isHidden = false
            btnV.isHidden = false
            btnInicio.isHidden = true
        }
        else if (perguntaIndex == 7){
            btnM.isHidden = true
            btnV.isHidden = true
            btnInicio.isHidden = false
            perguntaIndex = 0
                    
        }
        else{
            btnV.isHidden = false
            btnM.isHidden = false
        }
        label.text = perguntas[perguntaIndex];
        label.backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1)
    }
    
    
    @objc func retry(){
       label.backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1)
    }
    
    @objc func correta(sender: UIButton){
//        btnV.isHidden = true
//        btnM.isHidden = true
        self.label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    
        if (sender.tag == 1){
            btnM.isHidden = true
        }else{
            btnV.isHidden = true
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { timer in
            self.prox(sender: sender)
        })
        
        print("correto");
    }
    
    func incorreta(){
       label.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
//        btnV.isHidden = true
//        btnM.isHidden = true
        print("incorreto")
    }
    
    
    
}
PlaygroundPage.current.liveView = testeViewController();
