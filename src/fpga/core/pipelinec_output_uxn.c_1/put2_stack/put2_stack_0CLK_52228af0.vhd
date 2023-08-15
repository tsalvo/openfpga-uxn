-- Timing params:
--   Fixed?: True
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
-- Submodules: 9
entity put2_stack_0CLK_52228af0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 offset : in unsigned(7 downto 0);
 value : in unsigned(15 downto 0));
end put2_stack_0CLK_52228af0;
architecture arch of put2_stack_0CLK_52228af0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal put2_tmp : unsigned(15 downto 0) := to_unsigned(0, 16);
signal put2_tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_put2_tmp : unsigned(15 downto 0);
signal REG_COMB_put2_tmp8 : unsigned(7 downto 0);

-- Each function instance gets signals
-- stack_pointer_get[uxn_stack_h_l319_c14_81fa]
signal stack_pointer_get_uxn_stack_h_l319_c14_81fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l319_c14_81fa_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l319_c14_96f2]
signal BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l319_c14_0669]
signal BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_stack_h_l321_c51_7523]
signal CONST_SR_8_uxn_stack_h_l321_c51_7523_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l321_c2_9deb]
signal stack_data_set_uxn_stack_h_l321_c2_9deb_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l321_c2_9deb_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l321_c2_9deb_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l321_c2_9deb_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l322_c30_c4a0]
signal BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_stack_h_l322_c2_fb93]
signal stack_data_set_uxn_stack_h_l322_c2_fb93_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l322_c2_fb93_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l322_c2_fb93_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l322_c2_fb93_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l319_c14_81fa
stack_pointer_get_uxn_stack_h_l319_c14_81fa : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l319_c14_81fa_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l319_c14_81fa_stack_index,
stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2
BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_left,
BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_right,
BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l319_c14_0669
BIN_OP_MINUS_uxn_stack_h_l319_c14_0669 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_left,
BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_right,
BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output);

-- CONST_SR_8_uxn_stack_h_l321_c51_7523
CONST_SR_8_uxn_stack_h_l321_c51_7523 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l321_c51_7523_x,
CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output);

-- stack_data_set_uxn_stack_h_l321_c2_9deb
stack_data_set_uxn_stack_h_l321_c2_9deb : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l321_c2_9deb_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l321_c2_9deb_stack_index,
stack_data_set_uxn_stack_h_l321_c2_9deb_index,
stack_data_set_uxn_stack_h_l321_c2_9deb_value);

-- BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0
BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_left,
BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_right,
BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output);

-- stack_data_set_uxn_stack_h_l322_c2_fb93
stack_data_set_uxn_stack_h_l322_c2_fb93 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l322_c2_fb93_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l322_c2_fb93_stack_index,
stack_data_set_uxn_stack_h_l322_c2_fb93_index,
stack_data_set_uxn_stack_h_l322_c2_fb93_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 offset,
 value,
 -- Registers
 put2_tmp,
 put2_tmp8,
 -- All submodule outputs
 stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output,
 BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output,
 BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output,
 CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output,
 BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_offset : unsigned(7 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l321_c51_7523_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l321_c41_6fa7_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l322_c45_a595_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_put2_tmp : unsigned(15 downto 0);
variable REG_VAR_put2_tmp8 : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_put2_tmp := put2_tmp;
  REG_VAR_put2_tmp8 := put2_tmp8;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_offset := offset;
     VAR_value := value;

     -- Submodule level 0
     VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_right := VAR_offset;
     VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_stack_index := VAR_stack_index;
     VAR_CONST_SR_8_uxn_stack_h_l321_c51_7523_x := VAR_value;
     REG_VAR_put2_tmp := VAR_value;
     -- CAST_TO_uint8_t[uxn_stack_h_l322_c45_a595] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l322_c45_a595_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- stack_pointer_get[uxn_stack_h_l319_c14_81fa] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l319_c14_81fa_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l319_c14_81fa_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output := stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output;

     -- CONST_SR_8[uxn_stack_h_l321_c51_7523] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l321_c51_7523_x <= VAR_CONST_SR_8_uxn_stack_h_l321_c51_7523_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output := CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output;

     -- Submodule level 1
     VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l322_c45_a595_return_output;
     VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_left := VAR_stack_pointer_get_uxn_stack_h_l319_c14_81fa_return_output;
     -- CAST_TO_uint8_t[uxn_stack_h_l321_c41_6fa7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l321_c41_6fa7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l321_c51_7523_return_output);

     -- BIN_OP_MINUS[uxn_stack_h_l319_c14_96f2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_left;
     BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output := BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_left := VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_96f2_return_output;
     VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l321_c41_6fa7_return_output;
     -- BIN_OP_MINUS[uxn_stack_h_l319_c14_0669] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_left;
     BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output := BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_left := VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output;
     REG_VAR_put2_tmp8 := VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output;
     VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_index := VAR_BIN_OP_MINUS_uxn_stack_h_l319_c14_0669_return_output;
     -- stack_data_set[uxn_stack_h_l321_c2_9deb] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l321_c2_9deb_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l321_c2_9deb_stack_index <= VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_stack_index;
     stack_data_set_uxn_stack_h_l321_c2_9deb_index <= VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_index;
     stack_data_set_uxn_stack_h_l321_c2_9deb_value <= VAR_stack_data_set_uxn_stack_h_l321_c2_9deb_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_stack_h_l322_c30_c4a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_left;
     BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output := BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output;

     -- Submodule level 4
     VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_index := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l322_c30_c4a0_return_output, 8);
     -- stack_data_set[uxn_stack_h_l322_c2_fb93] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l322_c2_fb93_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l322_c2_fb93_stack_index <= VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_stack_index;
     stack_data_set_uxn_stack_h_l322_c2_fb93_index <= VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_index;
     stack_data_set_uxn_stack_h_l322_c2_fb93_value <= VAR_stack_data_set_uxn_stack_h_l322_c2_fb93_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_put2_tmp <= REG_VAR_put2_tmp;
REG_COMB_put2_tmp8 <= REG_VAR_put2_tmp8;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     put2_tmp <= REG_COMB_put2_tmp;
     put2_tmp8 <= REG_COMB_put2_tmp8;
 end if;
 end if;
end process;

end arch;
