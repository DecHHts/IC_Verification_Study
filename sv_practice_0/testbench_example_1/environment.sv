class env;

    driver d0;
    monitor m0;
    scoreboard s0;
    mailbox mbx_mon_sco;
    virtual reg_if vif;

    function new();
        d0 = new;
        m0 = new;
        s0 = new;
        mbx_mon_sco = new;
    endfunction
    
    task run();
        d0.vif = vif;
        m0.vif = vif;
        m0.mbx_mon_sco = mbx_mon_sco;
        s0.mbx_mon_sco = mbx_mon_sco;

        fork
            d0.run();
            m0.run();
            s0.run();
        join_any
    endtask
endclass