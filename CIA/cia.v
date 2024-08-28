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

// 2-bit Ripple Carry Adder module
module two_bit_ripple_carry_adder (
    input [1:0] A,    // 2-bit input A
    input [1:0] B,    // 2-bit input B
    input Cin,        // Carry-in input
    output [1:0] Sum, // 2-bit sum output
    output Cout       // Carry-out output
);
    wire C;

    // Instantiate 2 Full Adder modules
    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(C));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C), .Sum(Sum[1]), .Cout(Cout));
endmodule

// 4-bit Carry-Increment Adder module using two 2-bit RCAs
module four_bit_carry_increment_adder (
    input [3:0] A,    // 4-bit input A
    input Cin,        // Carry-in input (set to 1 for increment by 1)
    output [3:0] Sum, // 4-bit sum output
    output Cout       // Carry-out output
);
    wire C1;

    // First 2-bit adder
    two_bit_ripple_carry_adder U1 (
        .A(A[1:0]),
        .B(2'b00), // Adding 0s, as we are using the Cin for increment
        .Cin(Cin),
        .Sum(Sum[1:0]),
        .Cout(C1)
    );

    // Second 2-bit adder
    two_bit_ripple_carry_adder U2 (
        .A(A[3:2]),
        .B(2'b00), // Adding 0s, same as above
        .Cin(C1),
        .Sum(Sum[3:2]),
        .Cout(Cout)
    );
endmodule

