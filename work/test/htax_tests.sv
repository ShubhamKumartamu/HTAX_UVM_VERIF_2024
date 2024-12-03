class long_pkt_test extends base_test;
`uvm_component_utils(long_pkt_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", long_pkt_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting long packet test",UVM_NONE)
	endtask : run_phase
endclass : long_pkt_test

class short_pkt_test extends base_test;
`uvm_component_utils(short_pkt_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", short_pkt_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting short packet test",UVM_NONE)
	endtask : run_phase
endclass : short_pkt_test
class random_pkt_len_test extends base_test;
`uvm_component_utils(random_pkt_len_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", random_pkt_len_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting short packet test",UVM_NONE)
	endtask : run_phase
endclass : random_pkt_len_test

class mid_pkt_test extends base_test;
`uvm_component_utils(mid_pkt_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", mid_pkt_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting mid packet test",UVM_NONE)
	endtask : run_phase
endclass : mid_pkt_test

class serial_multiport_test extends base_test;
`uvm_component_utils(serial_multiport_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", serial_multiport_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting simultaneous packet test",UVM_NONE)
	endtask : run_phase
endclass : serial_multiport_test

class parallel_multiport_test extends base_test;
`uvm_component_utils(parallel_multiport_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", parallel_multiport_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting simultaneous packet test",UVM_NONE)
	endtask : run_phase
endclass : parallel_multiport_test

class parallel_complete_test extends base_test;
`uvm_component_utils(parallel_complete_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", parallel_complete_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting simultaneous packet test",UVM_NONE)
	endtask : run_phase
endclass : parallel_complete_test

class dest_port_cross_length_test extends base_test;
`uvm_component_utils(dest_port_cross_length_test)

function new (string name, uvm_component parent);
	super.new(name, parent);
endfunction
	function void build_phase(uvm_phase phase);
		uvm_config_wrapper::set(this,"tb.vsequencer.run_phase", "default_sequence", dest_port_cross_length_sequence::type_id::get());
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(),"Starting simultaneous packet test",UVM_NONE)
	endtask : run_phase
endclass : dest_port_cross_length_test


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////Virtual Sequences////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



class dest_port_cross_length_sequence  extends htax_base_vseq;

  `uvm_object_utils(dest_port_cross_length_sequence)

  rand int port;
  randc int len0;
  randc int len1;
  randc int len2;
  randc int len3;
  function new (string name = "dest_port_cross_length_sequence");
    super.new(name);
  endfunction : new
htax_packet_c req1;  // Declare the sequence item
htax_packet_c req2;  // Declare the sequence item
htax_packet_c req3;  // Declare the sequence item
htax_packet_c req4;  // Declare the sequence item


  task body();
req1 = htax_packet_c::type_id::create("req1");  // Create the sequence item
req2 = htax_packet_c::type_id::create("req2");  // Create the sequence item
req3 = htax_packet_c::type_id::create("req3");  // Create the sequence item
req4 = htax_packet_c::type_id::create("req4");  // Create the sequence item
	  //Run 10 random 
  fork 
  begin
	    for (int i =1; i<=3;i++)begin
		    for (int j =3; j<=63; j++) begin
			    for(int k =0; k<=3; k++) begin
	    `uvm_do_on_with(req1, p_sequencer.htax_seqr[0], {length == j; vc == i; dest_port == k;})
	    			end
    			end
    		end
	    `uvm_do_on_with(req1, p_sequencer.htax_seqr[0], {length == 12; vc == 2; dest_port == 3;})
	    `uvm_do_on_with(req1, p_sequencer.htax_seqr[0], {length == 16; vc == 3; dest_port == 3;})
    end
  begin
	    for (int i =1; i<=3;i++)begin
		    for (int j =3; j<=63; j++) begin
			    for(int k =0; k<=3; k++) begin
	    `uvm_do_on_with(req3, p_sequencer.htax_seqr[1], {length == j; vc == i; dest_port == k;})
	    			end
    			end
    		end
  end
  begin
	    for (int i =1; i<=3;i++)begin
		    for (int j =3; j<=63; j++) begin
			    for(int k =0; k<=3; k++) begin
	    `uvm_do_on_with(req4, p_sequencer.htax_seqr[2], {length == j; vc == i; dest_port == k;})
	    			end
    			end
    		end
	    `uvm_do_on_with(req4, p_sequencer.htax_seqr[2], {length == 12; vc == 1; dest_port == 3;})
	    `uvm_do_on_with(req4, p_sequencer.htax_seqr[2], {length == 16; vc == 2; dest_port == 3;})

  end
  begin
	    for (int i =1; i<=3;i++)begin
		    for (int j =3; j<=63; j++) begin
			    for(int k =0; k<=3; k++) begin
	    `uvm_do_on_with(req2, p_sequencer.htax_seqr[3], {length == j; vc == i; dest_port == k;})
	    			end
    			end
    		end
	    `uvm_do_on_with(req2, p_sequencer.htax_seqr[3], {length == 12; vc == 2; dest_port == 3;})
	    `uvm_do_on_with(req2, p_sequencer.htax_seqr[3], {length == 16; vc == 3; dest_port == 3;})

    end

  join
   $display("All ports completed");
  endtask : body

endclass : dest_port_cross_length_sequence




class random_pkt_len_sequence  extends htax_base_vseq;

  `uvm_object_utils(random_pkt_len_sequence)

  rand int port;
  randc int len0;
  randc int len1;
  randc int len2;
  randc int len3;

  function new (string name = "random_pkt_len_sequence");
    super.new(name);
  endfunction : new
htax_packet_c req1;  // Declare the sequence item
htax_packet_c req2;  // Declare the sequence item
htax_packet_c req3;  // Declare the sequence item
htax_packet_c req0;  // Declare the sequence item

  task body();
req1 = htax_packet_c::type_id::create("req1");  // Create the sequence item
req2 = htax_packet_c::type_id::create("req2");  // Create the sequence item
req3 = htax_packet_c::type_id::create("req3");  // Create the sequence item
req0 = htax_packet_c::type_id::create("req0");  // Create the sequence item

	  //Run 10 random 
    repeat(1000) begin
      port = $urandom_range(0,3);
      len0  = $urandom_range(3,10);
      len1  = $urandom_range(20,40);
      len2  = $urandom_range(50,63);
      len3  = $urandom_range(25,45);
      fork
      `uvm_do_on_with(req0, p_sequencer.htax_seqr[0], {length == len0; delay <10;})
      `uvm_do_on_with(req1, p_sequencer.htax_seqr[1], {length == len1; delay <10;})
      `uvm_do_on_with(req2, p_sequencer.htax_seqr[2], {length == len2; delay <10;})
      `uvm_do_on_with(req3, p_sequencer.htax_seqr[3], {length == len3; delay <10;})
      join
    end
  endtask : body

endclass : random_pkt_len_sequence
class parallel_complete_sequence  extends htax_base_vseq;

  `uvm_object_utils(parallel_complete_sequence)

  rand int port;
  randc int len0;
  randc int len1;
  randc int len2;
  randc int len3;
  function new (string name = "parallel_complete_sequence");
    super.new(name);
  endfunction : new
htax_packet_c req1;  // Declare the sequence item
htax_packet_c req2;  // Declare the sequence item
htax_packet_c req3;  // Declare the sequence item
htax_packet_c req4;  // Declare the sequence item


  task body();
req1 = htax_packet_c::type_id::create("req1");  // Create the sequence item
req2 = htax_packet_c::type_id::create("req2");  // Create the sequence item
req3 = htax_packet_c::type_id::create("req3");  // Create the sequence item
req4 = htax_packet_c::type_id::create("req4");  // Create the sequence item
	  //Run 10 random 
  fork 
  begin
    repeat(50) begin
	    for (int i =1; i<3;i++)begin
		    for (int j =3; j<63; j++) begin
			    for(int k =1; k<20; k++) begin
	    `uvm_do_on_with(req1, p_sequencer.htax_seqr[0], {length == j; vc == i; dest_port ==1; delay ==k;})
	    			end
    			end
    		end
    end
  end
  begin
   repeat(50) begin
	    for (int i =1; i<3;i++)begin
		    for (int j =3; j<63; j++) begin
			    for(int k =1; k<20; k++) begin
	    `uvm_do_on_with(req3, p_sequencer.htax_seqr[1], {length == j; vc == i; dest_port ==2; delay == k;})
	    			end
    			end
    		end
    end

  end
  begin
   repeat(50) begin
	    for (int i =1; i<3;i++)begin
		    for (int j =3; j<63; j++) begin
			    for(int k =1; k<2; k++) begin
	    `uvm_do_on_with(req4, p_sequencer.htax_seqr[2], {length == j; vc == i; dest_port ==k;})
	    			end
    			end
    		end
    end

  end
  begin
   repeat(50) begin
	    for (int i =1; i<3;i++)begin
		    for (int j =3; j<63; j++) begin
			    for(int k =1; k<2; k++) begin
	    `uvm_do_on_with(req2, p_sequencer.htax_seqr[3], {length == j; vc == i; dest_port ==k;})
	    			end
    			end
    		end
    end

  end
  join
   $display("All ports completed");
  endtask : body

endclass : parallel_complete_sequence


class serial_multiport_sequence  extends htax_base_vseq;

  `uvm_object_utils(serial_multiport_sequence)

  rand int port;
  randc int len0;
  randc int len1;
  randc int len2;
  randc int len3;
  semaphore sem1 = new(1);
  function new (string name = "serial_multiport_sequence");
    super.new(name);
  endfunction : new

  task body();
	  //Run 10 random 
  fork 
  begin
    repeat(50) begin
      len0  = $urandom_range(20,50);
      sem1.get(1);
      `uvm_do_on_with(req, p_sequencer.htax_seqr[0], {length == len0;})
      sem1.put(1);
    end
  end
  begin
    repeat(50) begin
      len1  = $urandom_range(20,50);
      sem1.get(1);
      `uvm_do_on_with(req, p_sequencer.htax_seqr[1], {length == len1;})
      sem1.put(1);
    end
  end
  begin
    repeat(50) begin
      len2  = $urandom_range(20,50);
      sem1.get(1);
      `uvm_do_on_with(req, p_sequencer.htax_seqr[2], {length == len2;})
      sem1.put(1);
    end
  end
  begin
    repeat(50) begin
      len3  = $urandom_range(20,50);
      sem1.get(1);
      `uvm_do_on_with(req, p_sequencer.htax_seqr[3], {length == len3;})
      sem1.put(1);
    end
  end
  join
   $display("All ports completed");
  endtask : body

endclass : serial_multiport_sequence



class parallel_multiport_sequence  extends htax_base_vseq;

  `uvm_object_utils(parallel_multiport_sequence)

  rand int port;
  randc int len0;
  randc int len1;
  randc int len2;
  randc int len3;
  function new (string name = "parallel_multiport_sequence");
    super.new(name);
  endfunction : new
htax_packet_c req1;  // Declare the sequence item
htax_packet_c req2;  // Declare the sequence item
htax_packet_c req3;  // Declare the sequence item
htax_packet_c req4;  // Declare the sequence item


  task body();
req1 = htax_packet_c::type_id::create("req1");  // Create the sequence item
req2 = htax_packet_c::type_id::create("req2");  // Create the sequence item
req3 = htax_packet_c::type_id::create("req3");  // Create the sequence item
req4 = htax_packet_c::type_id::create("req4");  // Create the sequence item
	  //Run 10 random 
  fork 
  begin
    repeat(50) begin
      len0  = $urandom_range(20,50);
      `uvm_do_on_with(req1, p_sequencer.htax_seqr[0], {length == len0;})
    end
  end
  begin
    repeat(50) begin
      len1  = $urandom_range(20,50);
      `uvm_do_on_with(req2, p_sequencer.htax_seqr[1], {length == len1;})
    end
  end
  begin
    repeat(50) begin
      len2  = $urandom_range(20,50);
      `uvm_do_on_with(req3, p_sequencer.htax_seqr[2], {length == len2;})
    end
  end
  begin
    repeat(50) begin
      len3  = $urandom_range(20,50);
      `uvm_do_on_with(req4, p_sequencer.htax_seqr[3], {length == len3;})
    end
  end
  join
   $display("All ports completed");
  endtask : body

endclass : parallel_multiport_sequence



class mid_pkt_sequence  extends htax_base_vseq;

  `uvm_object_utils(mid_pkt_sequence)

  rand int port;
  randc int len;

  function new (string name = "mid_pkt_sequence");
    super.new(name);
  endfunction : new

  task body();
	  //Run 10 random 
    repeat(50) begin
      port = $urandom_range(0,3);
      len  = $urandom_range(20,50);
      `uvm_do_on_with(req, p_sequencer.htax_seqr[1], {length == len;})
    end
  endtask : body

endclass : mid_pkt_sequence

class short_pkt_sequence  extends htax_base_vseq;

  `uvm_object_utils(short_pkt_sequence)

  rand int port;
  randc int len;

  function new (string name = "short_pkt_sequence");
    super.new(name);
  endfunction : new
htax_packet_c req1;  // Declare the sequence item
htax_packet_c req2;  // Declare the sequence item
htax_packet_c req3;  // Declare the sequence item
htax_packet_c req0;  // Declare the sequence item

  task body();
req1 = htax_packet_c::type_id::create("req1");  // Create the sequence item
req2 = htax_packet_c::type_id::create("req2");  // Create the sequence item
req3 = htax_packet_c::type_id::create("req3");  // Create the sequence item
req0 = htax_packet_c::type_id::create("req0");  // Create the sequence item

	  //Run 10 random 
    repeat(1000) begin
      port = $urandom_range(0,3);
      len  = $urandom_range(3,10);
      fork
      `uvm_do_on_with(req0, p_sequencer.htax_seqr[0], {length == len; delay <10;})
      `uvm_do_on_with(req1, p_sequencer.htax_seqr[1], {length == len; delay <10;})
      `uvm_do_on_with(req2, p_sequencer.htax_seqr[2], {length == len; delay <10;})
      `uvm_do_on_with(req3, p_sequencer.htax_seqr[3], {length == len; delay <10;})
      join
    end
  endtask : body

endclass : short_pkt_sequence

class long_pkt_sequence  extends htax_base_vseq;

  `uvm_object_utils(long_pkt_sequence)

  rand int port;
  randc int len;

  function new (string name = "long_pkt_sequence");
    super.new(name);
  endfunction : new

  task body();
	  //Run 10 random 
    repeat(10) begin
      port = $urandom_range(0,3);
      len  = $urandom_range(54,63);
      `uvm_do_on_with(req, p_sequencer.htax_seqr[port], {length == len;})

			//USE `uvm_do_on_with to add constraints on req
		
    end
  endtask : body

endclass : long_pkt_sequence
