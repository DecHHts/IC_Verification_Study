class scoreboard;

    mailbox mbx_mon_sco;
    reg_item reference[256];

    task run;
        forever begin
            reg_item item;
            mbx_mon_sco.get(item);
            item.display("Scoreboard");

            if(item.wr)begin
                if(reference[item.addr]==null)
                    reference[item.addr]=new;
                reference[item.addr]=item;
                $display("[T=%0t] | Scoreboard | Store | addr:%0d | data:%0d | wr:%0d |",$time,item.addr,item.wdata,item.wr);
            end

            if(!item.wr)begin
                if(item==null)
                    if(item.rdata == 'h1234)
                        $display("[T=%0t] | Check Pass | addr:%0d | wr:%0d |",$time,item.addr,item.wr);
                    else
                        $display("[T=%0t] | Check Error | addr:%0d | rdata:%0d | wdata:%0d | wr:%0d |",$time,item.addr,item.rdata,reference[item.addr].wdata,item.wr);
            end
            else begin
                if(item.rdata == reference[item.addr].wdata)
                    $display("[T=%0t] | Check Pass | addr:%0d | wr:%0d |",$time,item.addr,item.wr);
                else
                    $display("[T=%0t] | Check Error | addr:%0d | rdata:%0d | wdata:%0d | wr:%0d |",$time,item.addr,item.rdata,reference[item.addr].wdata,item.wr);
            end
        end
    endtask

endclass