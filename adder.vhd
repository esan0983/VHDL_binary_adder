LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
    port ( input1, input2, input3, input4, add, reset : in std_logic;
           output1, output2, output3, output4 : out std_logic );
end adder;

architecture arc of adder is
begin
    proc : process(input1, input2, input3, input4, add, reset) is
    variable memory, input, sum : std_logic_vector(3 downto 0) := "0000";
    variable temp : std_logic_vector(3 downto 0) := (others => '0');
    variable lock : std_logic := '0';
    begin
        input(0) := input1;
        input(1) := input2;
        input(2) := input3;
        input(3) := input4;

        if reset = '1' and lock = '0' then
            lock := '1';
            memory := "0000";
            sum := (others => '0');
            output1 <= sum(0);
            output2 <= sum(1);
            output3 <= sum(2);
            output4 <= sum(3);
            lock := '0';
        end if;

        if add = '1' and lock = '0' then
            lock := '1';
            temp := input + memory;
            for i in 0 to 3 loop
                memory(i) := temp(i);
                sum(i) := temp(i);
            end loop;
            output1 <= sum(0);
            output2 <= sum(1);
            output3 <= sum(2);
            output4 <= sum(3);
            lock := '0';
        end if;
    end process proc;
end architecture arc;