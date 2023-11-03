module timer
(
    // Declaração das portas
    //------------
    
    //------------
);
    //constantes 
    // Declaração dos sinais
    //------------
    //------------
    
    // Instanciação dos edge_detectors
    //------------
    //------------
    // Divisor de clock para gerar o ck1seg
    always @(posedge clock or posedge reset)
    begin
    end
    

    // Máquina de estados para determinar o estado atual (EA)
    always @(posedge clock or posedge reset)
    begin
    end

    // Decrementador de tempo (minutos e segundos)
    always @(posedge ck1seg or posedge reset)
    begin
    end
    
    // Instanciação da display 7seg
    //------------
endmodule