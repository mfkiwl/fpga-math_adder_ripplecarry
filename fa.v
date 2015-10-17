`timescale 1ns / 1ps

module fa( input a,      // a
           input b,      // b
           input ci,     // carry in
           output s,     // sum
           output co );  // carry out
 
    assign s = a ^ b ^ ci;
    assign co = a & b | ci & (a ^ b);
 
endmodule