class reg_item;

rand bit [7:0]  addr;
rand bit [15:0] wdata;
rand bit [15:0] rdata;
rand bit        wr;

function display(string tag);
    $display("[T=%0t] | %s | addr: %0d | wdata: %0d | rdata: %0d | wr: %0b",$time, tag, addr, wdata, rdata, wr);
endfunction

endclass : reg_item