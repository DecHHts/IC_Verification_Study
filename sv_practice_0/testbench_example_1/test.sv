class test;

    env e0;
    mailbox mbx_drv;

    function new();
        e0 = new;
        mbx_drv = new;
    endfunction

    virtual task run();
        e0.d0.mbx_drv = mbx_drv;
        fork
            e0.run();
        join_none
        apply_stim();
    endtask

    virtual task apply_stim();
        reg_item item;
        $display("[T=%0t] ---------- Test Starting Stimulate ----------");
        item = new;
        item.randomize() with { addr == 8'haa; wr == 1; };
        mbx_drv.put(item);

        item.randomize() with { addr == 8'haa; wr == 0; };
        mbx_drv.put(item);
    endtask
    
endclass