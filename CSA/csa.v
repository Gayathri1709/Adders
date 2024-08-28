// Full Adder module
module full_adder (
    input A,          // First input bit
    input B,          // Second input bit
    input Cin,        // Carry-in input
    output Sum,       // Sum output
    output Cout       // Carry-out output
);
    wire xor1, and1, and2;

    // Sum = A XOR B XOR Cin
    xor (xor1, A, B);
    xor (Sum, xor1, Cin);

    // Carry-out = (A AND B) OR (Cin AND (A XOR B))
    and (and1, A, B);
    and (and2, Cin, xor1);
    or (Cout, and1, and2);
endmodule

// 4-bit Carry Save Adder module
module four_bit_carry_save_adder (
    input [3:0] A,    // 4-bit input A
    input [3:0] B,    // 4-bit input B
    input [3:0] C,    // 4-bit input C
    output [3:0] Sum, // 4-bit sum output
    output [3:0] Carry // 4-bit carry output
);
    wire C1, C2, C3;

    // Full Adders for bit 0
    full_adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(C[0]),
        .Sum(Sum[0]),
        .Cout(C1)
    );

    // Full Adders for bit 1
    full_adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C[1]),
        .Sum(Sum[1]),
        .Cout(C2)
    );

    // Full Adders for bit 2
    full_adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C[2]),
        .Sum(Sum[2]),
        .Cout(C3)
    );

    // Full Adders for bit 3
    full_adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C[3]),
        .Sum(Sum[3]),
        .Cout(Carry[3])
    );

    // Carry outputs for each bit
    assign Carry[0] = C1;
    assign Carry[1] = C2;
    assign Carry[2] = C3;
    assign Carry[3] = Carry[3];
endmodule


