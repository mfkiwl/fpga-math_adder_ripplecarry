`timescale 1ns / 1ps

module add_test;

   localparam N = 32;
	reg [N:0] a;  // extra bit for the loop
	reg [N:0] b;  // extra bit for the loop
	reg ci;
	wire [N:0] s;
	wire co;

	add #(N) uut ( .a (  a[N-1:0] ), 
		            .b (  b[N-1:0] ), 
		            .ci( ci ), 
		            .s (  s ), 
		            .co( co ) );

	initial begin
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		for (a = 0; a < 2**N; a = a + 1)
         for (b = 0; b < 2**N; b = b + 1)
            #10 if ( a + b != s )
                $display( "%d + %d != %d", a, b, s );
	end
      
endmodule

