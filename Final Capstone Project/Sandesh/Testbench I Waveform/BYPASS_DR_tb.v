module Bypass_DR_tb();
wire SO_DR_OUT;
reg Update_DR, Capture_DR, Shift_DR, tdr_Select, TDI, TCK;

Bypass_DR byp(
Shift_DR,
Capture_DR, 
Update_DR,
TDI,
TCK,
tdr_Select,
SO_DR_OUT);

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
	Update_DR = 0;
	Capture_DR = 0;
	Shift_DR = 0;
end
endtask

task capture;
begin
  @(posedge TCK)
	 Capture_DR = 1'b1;
  @(posedge TCK)
	 Capture_DR = 1'b0;
end
endtask

task update;
begin
  @(posedge TCK)
	 Update_DR <= 1'b1;
  @(posedge TCK)
	 Update_DR <= 1'b0;
end
endtask

task shift(input i);
begin
@(posedge TCK)
	begin
	Shift_DR <= 1'b1;
	TDI <= i;
	end
end
endtask

initial
	begin
		initialise;
		#20;
		tdr_Select = 1;
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
				Shift_DR = 1'b0;
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
				Shift_DR = 1'b0;
			end
		#20;
		update;
		#20;

		$finish;
	end
endmodule
