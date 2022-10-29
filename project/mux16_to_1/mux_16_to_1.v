module mux_16_to_1(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,s0,s1,s2,s3,s4,out);
    input d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,s0,s1,s2,s3,s4;
    output out;
    wire mux1,mux2,mux3,mux4;
    
    mux8x1 mux_1(d0,d1,d2,d3,d4,d5,d6,d7,s2,s3,s4,mux1);
    mux8x1 mux_2(d8,d9,d10,d11,d12,d13,d14,d15,s2,s3,s4,mux2);
    mux8x1 mux_3(d16,d17,d18,d19,d20,d21,d22,d23,s2,s3,s4,mux3);
    mux8x1 mux_4(d24,d25,d26,d27,d28,d29,d30,d31,s2,s3,s4,mux4);
    mux4x1 mux_5(mux1,mux2,mux3,mux4,s0,s1,out);
endmodule

module mux2x1(d0,d1,s,out);
    input d0,d1,s;
    output out;
    wire sbar,t0,t1;
    
    not(sbar,s);
    and(t0,sbar,d0);
    and(t1,s,d1);
    or(out,t0,t1);
endmodule

module mux4x1(I0,I1,I2,I3,S0,S1,out);
    input I0,I1,I2,I3,S0,S1;
    output out;
    wire S0bar,S1bar,t,u,v,w;
    
    not(S0bar,S0); not(S1bar,S1);
    and(t,S0bar,S1bar,I0);
    and(u,S0bar,S1,I1);
    and(v,S0,S1bar,I2);
    and(w,S0,S1,I3);
    or(out,t,u,v,w);
endmodule

module mux8x1(d0,d1,d2,d3,d4,d5,d6,d7,s0,s1,s2,out);
    input d0,d1,d2,d3,d4,d5,d6,d7,s0,s1,s2;
    output out;
    wire mux1,mux2;
    
    mux4x1 mux_1(d0,d1,d2,d3,s1,s2,mux1);
    mux4x1 mux_2(d4,d5,d6,d7,s1,s2,mux2);
    mux2x1 mux_3(mux1,mux2,s0,out);
    
endmodule



