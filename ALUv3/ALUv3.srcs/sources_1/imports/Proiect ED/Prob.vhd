
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Proiect_ALUv3 is
port(
        ok : in STD_LOGIC;
		A 	: in STD_LOGIC_VECTOR (7 downto 0); 
		B 	: in STD_LOGIC_VECTOR (7 downto 0);
		Op_AND : in STD_LOGIC;
		Op_OR : in STD_LOGIC;
		Op_NAND : in STD_LOGIC;
		Op_XOR : in STD_LOGIC;
		C   : out  STD_LOGIC_VECTOR(7 downto 0)
	);
end Proiect_ALUv3;

Architecture behavior of Proiect_ALUv3 is

	signal tmp : std_logic_vector(7 downto 0);

begin

	process(A,B,Op_AND,Op_OR,Op_NAND,Op_XOR,ok)
	
	begin
        
        if rising_edge (ok) then
            if Op_AND = '1' then
                    tmp <= A and B; 
            end if;
        end if;
        
        if rising_edge (ok) then
            if Op_OR = '1' then
                    tmp <= A or B;
            end if;
        end if;
    
        if rising_edge (ok) then
            if Op_NAND = '1' then
                    tmp <= not(A and B);
            end if;
        end if;
        
        if rising_edge (ok) then  
            if Op_XOR = '1' then
      
                    tmp <= A xor B;
                end if;
        end if;
        
    
	end process;

	C <= tmp;

end behavior;
