`timescale 1ns / 1ps

module add #( parameter N = 4)
            ( input [N-1:0] a,b, // numbers to be added together
              input ci,          // carry in
              output [N:0] s,    // sum
              output co);        // carry out
				  
   wire [N-2:0] c; // internal carries

   // array instantiation
   fa fa_inst [N-1:0] ( .a  ( a ),
	                     .b  ( b ),
					  	  	   .ci ( {c, ci} ),
                        .s  ( s[N-1:0] ),
								.co ( {s[N], c}) );
endmodule
