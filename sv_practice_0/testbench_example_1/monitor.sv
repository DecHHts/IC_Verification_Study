class monitor;

    virtual reg_if vif;
    mailbox mbx_mon_sco;

    task run();
        $display("[T=%0t] ---------- Monitor Begin ----------",$time);
        @(posedge vif.clk);
        forever begin
            if(vif.sel) begin
                reg_item item;
                item.wr     <= vif.wr;
                item.addr   <= vif.addr;
                item.wdata  <= vif.wdata;
                if(!vif.wr) begin
                    @(posedge vif.clk);
                    item.rdata  <= vif.rdata;
                end
                item.display("Monitor");
                mbx_mon_sco.put(item);
            end
        end
    endtask

endclass