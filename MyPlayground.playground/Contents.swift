import UIKit
import PlaygroundSupport

class testeViewController : UIViewController //Controller -> Controla a view
{
    var label : UILabel!; //Declara Label
    
    var btnV : UIButton!;
    var btnM : UIButton!;
    var btnN : UIButton!;
    var btnR : UIButton!;
    
    let perguntas = ["1 - Pergunta1", "2 - Pergunta2", "3 - Pergunta3", "4 - Pergunta4", "5 - Pergunta5", "6 - Pergunta6"]
    let respostasCorretas = [1, 0, 0, 1, 1, 0]
    
    var perguntaIndex = 0;
    
    override func loadView() {   //Sobrescreve método loadView() -> Dispara quando a view é carregada
        let view = UIView();     //Instancia view
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1);
        view.layer.borderColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
        view.layer.borderWidth = 10
        view.layer.cornerRadius = 20//Set a cor de fundo
        
            
        label = UILabel();          //Instacia Label
        label.text = perguntas[perguntaIndex];     //Set texto
        label.textColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1);   //Set cor do texto
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.4, green: 0.3607843137, blue: 0.6470588235, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.font = UIFont.systemFont(ofSize:  20)
        view.addSubview(label);     //Adiciono a label na view
        
        //config botao de Verdade
        btnV = UIButton(type: .system);
        btnV.setTitle("Verdade", for: .normal);
        btnV.tintColor = .black
        btnV.tag = 1
        btnV.backgroundColor = .white;
        view.addSubview(btnV)
        
        //config botao de Mentira
        btnM = UIButton(type: .system);
        btnM.setTitle("Mentira", for: .normal);
        btnM.tintColor = .black
        btnM.tag = 0
        btnM.backgroundColor = .white;
        view.addSubview(btnM)
        
        //config botao de Proximo
        btnN = UIButton(type: .system);
        btnN.setTitle("Proximo", for: .normal);
        btnN.tintColor = .black
        btnN.backgroundColor = .white;
        btnN.isHidden = true
        view.addSubview(btnN)
        
        //config botao de Tentar Novamente
        btnR = UIButton(type: .system);
        btnR.setTitle("retry", for: .normal);
        btnR.tintColor = .black
        btnR.backgroundColor = .white;
        btnR.isHidden = true
        view.addSubview(btnR)
        
        //Autoresinzing
        label.translatesAutoresizingMaskIntoConstraints = false;   //
        btnV.translatesAutoresizingMaskIntoConstraints  = false;
        btnM.translatesAutoresizingMaskIntoConstraints  = false;
        btnN.translatesAutoresizingMaskIntoConstraints  = false;
        btnR.translatesAutoresizingMaskIntoConstraints  = false;
        
        let margins = view.layoutMarginsGuide; //Pego os valores de margem do sistema (tela)
              
        NSLayoutConstraint.activate([    //Funçao que aparentemente define o local dos objetos na tela
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 5),    //Define os valores da posição do eixo X
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor,constant: -5),//Define os valores da posição do eixo X
            label.topAnchor.constraint(equalTo:margins.topAnchor,constant: 25),     //Define os valores da posição do eixo Y
            label.heightAnchor.constraint(equalToConstant: 250),
//            label.widthAnchor.constraint(equalToConstant: 10),
            
            btnV.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 30),    //Define os valores da posição do eixo X
            btnV.topAnchor.constraint(equalTo:margins.topAnchor, constant: 600),     //Define os valores da posição do eixo Y
      
            
            btnM.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 100),    //Define os valores da posição do eixo X
            btnM.topAnchor.constraint(equalTo:margins.topAnchor, constant: 600),     //Define os valores da posição do eixo Y
            
            
            btnN.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 200),    //Define os valores da posição do eixo X
            btnN.topAnchor.constraint(equalTo:margins.topAnchor, constant: 600),
            
            btnR.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 200),    //Define os valores da posição do eixo X
            btnR.topAnchor.constraint(equalTo:margins.topAnchor, constant: 600),     //Define os valores da posição do eixo Y//Define os valores da posição do eixo Y

        ])
        
        btnV.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        btnM.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        btnN.addTarget(self, action: #selector(prox), for: .touchUpInside)
        btnR.addTarget(self, action: #selector(retry), for: .touchUpInside)
        
        
        
        
        self.view = view;  //Define a view como a view principal
    }
    
    @objc func verificar(sender: UIButton) {

        if (respostasCorretas[perguntaIndex] == sender.tag) {
            correta();
        }
        else{
            incorreta();
        }
    }
    
    @objc func prox(){
        perguntaIndex += 1;
        label.text = perguntas[perguntaIndex];
        label.backgroundColor = .gray
        btnN.isHidden = true
        btnV.isHidden = false
        btnM.isHidden = false
    }
    
    
    @objc func retry(){
        label.backgroundColor = .gray
        btnR.isHidden = true
        btnV.isHidden = false
        btnM.isHidden = false
    }
    
    func correta(){
        label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        btnN.isHidden = false
        btnV.isHidden = true
        btnM.isHidden = true
        print("correto");
    }
    
    func incorreta(){
        label.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        btnR.isHidden = false
        btnV.isHidden = true
        btnM.isHidden = true
        print("incorreto")
    }
    
    
    
}
PlaygroundPage.current.liveView = testeViewController();
