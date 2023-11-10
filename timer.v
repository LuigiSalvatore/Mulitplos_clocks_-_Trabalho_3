module timer
(
    // Declaração das portas
    //------------
    input reset, clock, f_en,
    output [15:0] t_out,
    output t_valid
    //------------
);
    //constantes 
    //------------
    parameter MAX_COUNT = 'd65535;
    parameter HALF_MS_COUNT = 50_000_000;
    //------------

    // Declaração dos sinais
    //------------
    reg [15:0] t_out_int;
    reg [26:0] clock_count;
    reg t_valid_int, ck1seg;
    //------------

    // Divisor de clock para gerar o ck1seg
    always @(posedge clock or posedge reset)
    begin
        if(reset) begin
            ck1seg <= 0;
            clock_count <= 0;
        end
        else begin
            if (clock_count == HALF_MS_COUNT) begin
                clock_count <= 'd0;
                ck1seg <= ~ck1seg;
            end else begin
                clock_count <= clock_count + 'd1;
            end
        end
    end

    // Logica do counter
    always @(posedge ck1seg or posedge reset)
    begin
        if (reset) begin
            t_out_int <= 'd0;
            t_valid_int <= 'd0;
        end
        else begin 
            if (t_en == 1) begin
                t_valid_out <= 'd1;
                if (t_out_int == MAX_COUNT)
                    t_out_int <= 'd0;
                else
                    t_out_int <= t_out_int +'d1;
            end
            else 
            t_valid_out <= 'd0;
        end
    end
    
    assign t_valid = t_valid_int;
    assign t_out = t_out_int;
    
endmodule