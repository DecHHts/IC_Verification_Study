class driver;

    virtual reg_if  vif;
    mailbox         mbx_drv;
    event           drv_done;

    task run();
        $display("[T=%0t] ------------ Driver Begin ----------", $time);
        @(posedge vif.clk)
        forever begin
            reg_item item;
            $display("[T=%0t] ---------- Waiting for getting item ----------",$time);
            mbx_drv.get(item);
            $display("[T=%0t] ---------- Got item ----------",$time);
            item.display("Driver");
            vif.sel     <= 1;
            vif.wr      <= item.wr;
            vif.wdata   <= item.wdata;
            vif.addr    <= item.addr;
            while(!vif.ready)begin
                $display("[T=%0t] ---------- Waiting for ready ----------",$time);
                @(posedge vif.clk);
            end
            vif.sel     <= 0;
            ->drv_done;
            $display("[T=%0t] ---------- Driver Done ----------",$time);
        end
    endtask

endclass : driver