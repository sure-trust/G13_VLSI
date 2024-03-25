module INSTRUCTION_REGISTER_tb();
wire SO_IR_OUT, IR_OUT;
reg Update_IR, Capture_IR, Shift_IR, TDI, TCK;

INSTRUCTION_REGISTER ir(
Update_IR,
Capture_IR,
Shift_IR,
TDI,
SO_IR_OUT,
IR_OUT,
TCK);

always
	begin
		TCK = 0;
		#10;
		TCK = 1;
		#10;
	end

task initialise;
begin
	TDI = 0;
	Update_IR = 0;
	Capture_IR = 0;
	Shift_IR = 0;
end
endtask

task capture;
begin
  @(posedge TCK)
	 Capture_IR = 1'b1;
  @(posedge TCK)
	 Capture_IR = 1'b0;
end
endtask

task update;
begin
  @(posedge TCK)
	 Update_IR <= 1'b1;
  @(posedge TCK)
	 Update_IR <= 1'b0;
end
endtask

task shift(input i);
begin
@(posedge TCK)
	begin
	Shift_IR <= 1'b1;
	TDI <= i;
	end
end
endtask

initial
	begin
		initialise;
		#20;
		capture;
		#20;
		shift(1'b0);
		shift(1'b0);
		shift(1'b0);
		shift(1'b0);
		shift(1'b0);
		@(posedge TCK)
			begin
				Shift_IR = 1'b0;
			end
		#20;
		update;
		#20;

		capture;
		#20;
		shift(1'b0);
		shift(1'b1);
		shift(1'b1);
		shift(1'b1);
		shift(1'b0);
		@(posedge TCK)
			begin
				Shift_IR = 1'b0;
			end
		#20;
		update;
		#20;

		$finish;
	end
endmodule
