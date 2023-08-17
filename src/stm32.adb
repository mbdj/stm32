
--
-- Mehdi 27/08/2022 --
--
--  blinky
--

with Last_Chance_Handler;
pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

with STM32.Board; use STM32.Board;

with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
--  pragma Priority (System.Priority'First);

	Period : constant Time_Span := Milliseconds (500);
	Next_Release : Time := Clock;

begin

	STM32.Board.Initialize_LEDs;

	STM32.Board.Turn_On (Green_LED);
	STM32.Board.Turn_On (Blue_LED);

	loop
		STM32.Board.Toggle (Green_LED);
		STM32.Board.Toggle (Blue_LED);

		Next_Release := Next_Release + Period;
		delay until Next_Release;
	end loop;
end Main;
