/* Generated by Yosys 0.33 (git sha1 2584903a060) */

module four_bit_carry_save_adder(A, B, C, Sum, Carry);
  input [3:0] A;
  wire [3:0] A;
  input [3:0] B;
  wire [3:0] B;
  input [3:0] C;
  wire [3:0] C;
  wire C1;
  wire C2;
  wire C3;
  output [3:0] Carry;
  wire [3:0] Carry;
  output [3:0] Sum;
  wire [3:0] Sum;
  full_adder FA0 (
    .A(A[0]),
    .B(B[0]),
    .Cin(C[0]),
    .Cout(C1),
    .Sum(Sum[0])
  );
  full_adder FA1 (
    .A(A[1]),
    .B(B[1]),
    .Cin(C[1]),
    .Cout(C2),
    .Sum(Sum[1])
  );
  full_adder FA2 (
    .A(A[2]),
    .B(B[2]),
    .Cin(C[2]),
    .Cout(C3),
    .Sum(Sum[2])
  );
  full_adder FA3 (
    .A(A[3]),
    .B(B[3]),
    .Cin(C[3]),
    .Cout(Carry[3]),
    .Sum(Sum[3])
  );
  assign Carry[2:0] = { C3, C2, C1 };
endmodule

module full_adder(A, B, Cin, Sum, Cout);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  input A;
  wire A;
  input B;
  wire B;
  input Cin;
  wire Cin;
  output Cout;
  wire Cout;
  output Sum;
  wire Sum;
  NOR _10_ (
    .A(Cin),
    .B(_01_),
    .Y(_05_)
  );
  NOR _11_ (
    .A(_03_),
    .B(_05_),
    .Y(Sum)
  );
  NOT _12_ (
    .A(Cin),
    .Y(_06_)
  );
  NAND _13_ (
    .A(A),
    .B(B),
    .Y(_07_)
  );
  NOT _14_ (
    .A(_07_),
    .Y(_08_)
  );
  NOR _15_ (
    .A(A),
    .B(B),
    .Y(_09_)
  );
  NOT _16_ (
    .A(_09_),
    .Y(_00_)
  );
  NOR _17_ (
    .A(_08_),
    .B(_09_),
    .Y(_01_)
  );
  NAND _18_ (
    .A(_07_),
    .B(_00_),
    .Y(_02_)
  );
  NOR _19_ (
    .A(_06_),
    .B(_02_),
    .Y(_03_)
  );
  NAND _20_ (
    .A(Cin),
    .B(_01_),
    .Y(_04_)
  );
  NAND _21_ (
    .A(_07_),
    .B(_04_),
    .Y(Cout)
  );
endmodule
