// 2-bit Carry Lookahead Adder module
module two_bit_carry_lookahead_adder (
    input [1:0] A,    // 2-bit input A
    input [1:0] B,    // 2-bit input B
    input Cin,        // Carry-in input
    output [1:0] Sum, // 2-bit sum output
    output Cout       // Carry-out output
);
    wire P0, P1;      // Propagate signals
    wire G0, G1;      // Generate signals
    wire C1;          // Intermediate carry

    // Generate and Propagate for each bit
    assign P0 = A[0] ^ B[0];
    assign G0 = A[0] & B[0];
    assign P1 = A[1] ^ B[1];
    assign G1 = A[1] & B[1];

    // Sum and carry calculations
    assign Sum[0] = P0 ^ Cin;
    assign C1 = G0 | (P0 & Cin);
    assign Sum[1] = P1 ^ C1;
    assign Cout = G1 | (P1 & C1);
endmodule

// 4-bit Carry-Increment Adder module using two 2-bit CLAs
module four_bit_carry_increment_adder (
    input [3:0] A,    // 4-bit input A
    input Cin,        // Carry-in input (set to 1 for increment by 1)
    output [3:0] Sum, // 4-bit sum output
    output Cout       // Carry-out output
);
    wire C2;          // Carry-out from the first 2-bit CLA

    // First 2-bit CLA for the lower 2 bits
    two_bit_carry_lookahead_adder CLA0 (
        .A(A[1:0]),
        .B(2'b00),    // Adding 0s to A, Cin will increment by 1
        .Cin(Cin),
        .Sum(Sum[1:0]),
        .Cout(C2)
    );

    // Second 2-bit CLA for the upper 2 bits
    two_bit_carry_lookahead_adder CLA1 (
        .A(A[3:2]),
        .B(2'b00),    // Adding 0s to A, carry from CLA0 will be considered
        .Cin(C2),
        .Sum(Sum[3:2]),
        .Cout(Cout)
    );
endmodule

