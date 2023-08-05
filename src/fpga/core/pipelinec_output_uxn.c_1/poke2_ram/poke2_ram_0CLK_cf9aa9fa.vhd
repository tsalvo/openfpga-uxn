-- Timing params:
--   Fixed?: False
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 6
entity poke2_ram_0CLK_cf9aa9fa is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(15 downto 0);
 value : in unsigned(15 downto 0));
end poke2_ram_0CLK_cf9aa9fa;
architecture arch of poke2_ram_0CLK_cf9aa9fa is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- CONST_SR_8[uxn_ram_main_h_l67_c36_c59c]
signal CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output : unsigned(15 downto 0);

-- main_ram_write[uxn_ram_main_h_l67_c2_cb6a]
signal main_ram_write_uxn_ram_main_h_l67_c2_cb6a_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_write_uxn_ram_main_h_l67_c2_cb6a_address : unsigned(15 downto 0);
signal main_ram_write_uxn_ram_main_h_l67_c2_cb6a_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_ram_main_h_l68_c17_b53c]
signal BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output : unsigned(16 downto 0);

-- main_ram_write[uxn_ram_main_h_l68_c2_949b]
signal main_ram_write_uxn_ram_main_h_l68_c2_949b_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_write_uxn_ram_main_h_l68_c2_949b_address : unsigned(15 downto 0);
signal main_ram_write_uxn_ram_main_h_l68_c2_949b_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_8_uxn_ram_main_h_l67_c36_c59c
CONST_SR_8_uxn_ram_main_h_l67_c36_c59c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_x,
CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output);

-- main_ram_write_uxn_ram_main_h_l67_c2_cb6a
main_ram_write_uxn_ram_main_h_l67_c2_cb6a : entity work.main_ram_write_0CLK_b45f1687 port map (
clk,
main_ram_write_uxn_ram_main_h_l67_c2_cb6a_CLOCK_ENABLE,
main_ram_write_uxn_ram_main_h_l67_c2_cb6a_address,
main_ram_write_uxn_ram_main_h_l67_c2_cb6a_value);

-- BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c
BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_left,
BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_right,
BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output);

-- main_ram_write_uxn_ram_main_h_l68_c2_949b
main_ram_write_uxn_ram_main_h_l68_c2_949b : entity work.main_ram_write_0CLK_b45f1687 port map (
clk,
main_ram_write_uxn_ram_main_h_l68_c2_949b_CLOCK_ENABLE,
main_ram_write_uxn_ram_main_h_l68_c2_949b_address,
main_ram_write_uxn_ram_main_h_l68_c2_949b_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 value,
 -- All submodule outputs
 CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output,
 BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_address : unsigned(15 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_address : unsigned(15 downto 0);
 variable VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_ram_main_h_l67_c26_8579_return_output : unsigned(7 downto 0);
 variable VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_address : unsigned(15 downto 0);
 variable VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_ram_main_h_l68_c30_0c74_return_output : unsigned(7 downto 0);
 variable VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_CLOCK_ENABLE : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;
     VAR_value := value;

     -- Submodule level 0
     VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_left := VAR_address;
     VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_address := VAR_address;
     VAR_CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_x := VAR_value;
     -- BIN_OP_PLUS[uxn_ram_main_h_l68_c17_b53c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_left <= VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_left;
     BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_right <= VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output := BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output;

     -- CONST_SR_8[uxn_ram_main_h_l67_c36_c59c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_x <= VAR_CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output := CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output;

     -- CAST_TO_uint8_t[uxn_ram_main_h_l68_c30_0c74] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_ram_main_h_l68_c30_0c74_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- Submodule level 1
     VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_address := resize(VAR_BIN_OP_PLUS_uxn_ram_main_h_l68_c17_b53c_return_output, 16);
     VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_value := VAR_CAST_TO_uint8_t_uxn_ram_main_h_l68_c30_0c74_return_output;
     -- main_ram_write[uxn_ram_main_h_l68_c2_949b] LATENCY=0
     -- Clock enable
     main_ram_write_uxn_ram_main_h_l68_c2_949b_CLOCK_ENABLE <= VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_CLOCK_ENABLE;
     -- Inputs
     main_ram_write_uxn_ram_main_h_l68_c2_949b_address <= VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_address;
     main_ram_write_uxn_ram_main_h_l68_c2_949b_value <= VAR_main_ram_write_uxn_ram_main_h_l68_c2_949b_value;
     -- Outputs

     -- CAST_TO_uint8_t[uxn_ram_main_h_l67_c26_8579] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_ram_main_h_l67_c26_8579_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_ram_main_h_l67_c36_c59c_return_output);

     -- Submodule level 2
     VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_value := VAR_CAST_TO_uint8_t_uxn_ram_main_h_l67_c26_8579_return_output;
     -- main_ram_write[uxn_ram_main_h_l67_c2_cb6a] LATENCY=0
     -- Clock enable
     main_ram_write_uxn_ram_main_h_l67_c2_cb6a_CLOCK_ENABLE <= VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_CLOCK_ENABLE;
     -- Inputs
     main_ram_write_uxn_ram_main_h_l67_c2_cb6a_address <= VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_address;
     main_ram_write_uxn_ram_main_h_l67_c2_cb6a_value <= VAR_main_ram_write_uxn_ram_main_h_l67_c2_cb6a_value;
     -- Outputs

   end if;
 end loop;

end process;

end arch;
