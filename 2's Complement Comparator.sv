// Verilog module for comparing two N-bit numbers in 2's complement form.
// The comparison starts from the most significant bit (MSB).

module TwosComplementComparator #(
    parameter WIDTH = 8 // Default bit width, can be overridden during instantiation
) (
    input  wire signed [WIDTH-1:0] num_a,     // First number (signed)
    input  wire signed [WIDTH-1:0] num_b,     // Second number (signed)
    output reg         a_is_bigger,       // Flag: num_a is bigger than num_b
    output reg         b_is_bigger,       // Flag: num_b is bigger than num_a
    output reg         equal              // Flag: num_a is equal to num_b
);

    // Integer for loop iteration
    integer i;

    // Combinational logic block, re-evaluates when inputs change
    always @(*) begin
        // Initialize output flags to false (0) at the beginning of each evaluation
        a_is_bigger = 1'b0;
        b_is_bigger = 1'b0;
        equal = 1'b0;

        // Step 1: Compare the Most Significant Bits (MSBs) - Sign Bits
        // In 2's complement: 0 for positive/zero, 1 for negative.
        // A positive number (MSB=0) is always bigger than a negative number (MSB=1).
        if (num_a[WIDTH-1] == 1'b0 && num_b[WIDTH-1] == 1'b1) begin
            // num_a is positive or zero, num_b is negative.
            a_is_bigger = 1'b1;
        end else if (num_a[WIDTH-1] == 1'b1 && num_b[WIDTH-1] == 1'b0) begin
            // num_a is negative, num_b is positive or zero.
            b_is_bigger = 1'b1;
        end else begin
            // MSBs are equal, meaning both numbers have the same sign.
            // Proceed to compare the remaining bits from left (MSB-1) to right (LSB).

            // Assume equal until a difference is found
            equal = 1'b1; // Tentatively set equal, will be overridden if a difference is found

            // Iterate from the second most significant bit down to the least significant bit
            for (i = WIDTH - 2; i >= 0; i = i - 1) begin
                if (num_a[i] != num_b[i]) begin // If bits are different
                    equal = 1'b0; // No longer equal
                    if (num_a[i] == 1'b1) begin // num_a[i] is 1, num_b[i] must be 0
                        // For numbers with the same sign (or positive numbers),
                        // the one with the first '1' (from left) where the other has '0' is larger.
                        // For negative numbers (where MSBs were both 1), this logic also holds true
                        // because -1 (1111) > -2 (1110) if WIDTH=4.
                        // The logic is: if signs are same, a '1' at a more significant position
                        // makes the number larger if positive, or less negative (larger) if negative.
                        a_is_bigger = 1'b1;
                    end else begin // num_a[i] is 0, num_b[i] must be 1
                        b_is_bigger = 1'b1;
                    end
                    break; // Difference found, comparison ends, exit loop
                end
                // If bits are equal, continue to the next bit (loop continues)
            end
            // If the loop completes without 'break', all bits (from MSB-1 to LSB) were equal.
            // Since MSBs were also equal, the numbers are truly equal.
            // 'equal' will remain 1'b1 as set before the loop.
        end
    end

endmodule