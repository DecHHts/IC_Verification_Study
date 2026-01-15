interface reg_if (input bit clk);

    logic           rst_n; 
    logic [7:0]     addr;
    logic           sel;
    logic           wr;
    logic [15:0]    wdata;
    logic [15:0]    rdata;
    logic           ready;

endinterface