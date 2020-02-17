import UIKit
import PlaygroundSupport

class testeViewController : UIViewController //Controller -> Controla a view
{
    var label : UILabel!; //Declara Label
    
    var btnV : UIButton!;
    var btnM : UIButton!;
    
    let perguntas = ["1 - Pergunta1", "2 - Pergunta1", "3 - Pergunta1", "4 - Pergunta1", "5 - Pergunta1", "6 - Pergunta1"]
    let respostasCorretas = [1, 0, 0, 1, 1, 0]
    
    var perguntaIndex = 0;
    
    override func loadView() {   //Sobrescreve método loadView() -> Dispara quando a view é carregada
        let view = UIView();     //Instancia view
        view.backgroundColor = .black;  //Set a cor de fundo
     
            
        label = UILabel();          //Instacia Label
        label.text = perguntas[perguntaIndex];     //Set texto
        label.textColor = .white;   //Set cor do texto
        label.textAlignment = .natural
        label.backgroundColor = .red
        view.addSubview(label);     //Adiciono a label na view
        
        btnV = UIButton(type: .system);
        btnV.setTitle("V", for: .normal);
        btnV.tintColor = .black
        btnV.tag = 0
        btnV.backgroundColor = .white;
        view.addSubview(btnV)
        
        btnM = UIButton(type: .system);
        btnM.setTitle("M", for: .normal);
        btnM.tintColor = .black
        btnM.tag = 1
        btnM.backgroundColor = .white;
        view.addSubview(btnM)
        
        label.translatesAutoresizingMaskIntoConstraints = false;   //
        btnV.translatesAutoresizingMaskIntoConstraints  = false;
        btnM.translatesAutoresizingMaskIntoConstraints  = false;
        
        
        let margins = view.layoutMarginsGuide; //Pego os valores de margem do sistema (tela)
              
        
        
        NSLayoutConstraint.activate([    //Funçao que aparentemente define o local dos objetos na tela
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 30),    //Define os valores da posição do eixo X
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor,constant: 10),//Define os valores da posição do eixo X
            label.topAnchor.constraint(equalTo:margins.topAnchor,constant: 10),     //Define os valores da posição do eixo Y
            label.heightAnchor.constraint(equalToConstant: 50),
            
            
            btnV.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 30),    //Define os valores da posição do eixo X
            btnV.topAnchor.constraint(equalTo:margins.topAnchor, constant: 600),     //Define os valores da posição do eixo Y
      
            
          btnM.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 100),    //Define os valores da posição do eixo X
          btnM.topAnchor.constraint(equalTo:margins.topAnchor, constant: 600),     //Define os valores da posição do eixo Y

        ])
        
        btnV.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        btnM.addTarget(self, action: #selector(verificar), for: .touchUpInside)
        
        
        
        
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
    
    func correta(){
        label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        perguntaIndex += 1;
        label.text = perguntas[perguntaIndex];
        print("1")
    }
    
    func incorreta(){
        label.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        print("2")
    }
    
    
}
PlaygroundPage.current.liveView = testeViewController();
