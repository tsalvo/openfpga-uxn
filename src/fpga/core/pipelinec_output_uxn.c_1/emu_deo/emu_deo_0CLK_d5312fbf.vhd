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
-- Submodules: 5
entity emu_deo_0CLK_d5312fbf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_index : in unsigned(3 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end emu_deo_0CLK_d5312fbf;
architecture arch of emu_deo_0CLK_d5312fbf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l220_c6_a078]
signal BIN_OP_EQ_uxn_device_h_l220_c6_a078_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c6_a078_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c1_0d67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l220_c2_a313]
signal result_MUX_uxn_device_h_l220_c2_a313_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c2_a313_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c2_a313_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c2_a313_return_output : device_out_result_t;

-- screen_deo[uxn_device_h_l221_c12_bb2a]
signal screen_deo_uxn_device_h_l221_c12_bb2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_deo_uxn_device_h_l221_c12_bb2a_device_port : unsigned(3 downto 0);
signal screen_deo_uxn_device_h_l221_c12_bb2a_phase : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l221_c12_bb2a_previous_device_ram_read : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l221_c12_bb2a_previous_ram_read : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l221_c12_bb2a_return_output : device_out_result_t;

function CONST_REF_RD_device_out_result_t_device_out_result_t_37d8( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_deo_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l220_c6_a078
BIN_OP_EQ_uxn_device_h_l220_c6_a078 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c6_a078_left,
BIN_OP_EQ_uxn_device_h_l220_c6_a078_right,
BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output);

-- result_MUX_uxn_device_h_l220_c2_a313
result_MUX_uxn_device_h_l220_c2_a313 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c2_a313_cond,
result_MUX_uxn_device_h_l220_c2_a313_iftrue,
result_MUX_uxn_device_h_l220_c2_a313_iffalse,
result_MUX_uxn_device_h_l220_c2_a313_return_output);

-- screen_deo_uxn_device_h_l221_c12_bb2a
screen_deo_uxn_device_h_l221_c12_bb2a : entity work.screen_deo_0CLK_f4fa0157 port map (
clk,
screen_deo_uxn_device_h_l221_c12_bb2a_CLOCK_ENABLE,
screen_deo_uxn_device_h_l221_c12_bb2a_device_port,
screen_deo_uxn_device_h_l221_c12_bb2a_phase,
screen_deo_uxn_device_h_l221_c12_bb2a_previous_device_ram_read,
screen_deo_uxn_device_h_l221_c12_bb2a_previous_ram_read,
screen_deo_uxn_device_h_l221_c12_bb2a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_index,
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output,
 result_MUX_uxn_device_h_l220_c2_a313_return_output,
 screen_deo_uxn_device_h_l221_c12_bb2a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_index : unsigned(3 downto 0);
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c2_a313_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c2_a313_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8_uxn_device_h_l220_c2_a313_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c2_a313_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c2_a313_cond : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l221_c12_bb2a_device_port : unsigned(3 downto 0);
 variable VAR_screen_deo_uxn_device_h_l221_c12_bb2a_phase : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l221_c12_bb2a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l221_c12_bb2a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l221_c12_bb2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l221_c12_bb2a_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_right := to_unsigned(2, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_index := device_index;
     VAR_device_port := device_port;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_left := VAR_device_index;
     VAR_screen_deo_uxn_device_h_l221_c12_bb2a_device_port := VAR_device_port;
     VAR_screen_deo_uxn_device_h_l221_c12_bb2a_phase := VAR_phase;
     VAR_screen_deo_uxn_device_h_l221_c12_bb2a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_deo_uxn_device_h_l221_c12_bb2a_previous_ram_read := VAR_previous_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l220_c6_a078] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c6_a078_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_left;
     BIN_OP_EQ_uxn_device_h_l220_c6_a078_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output := BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8[uxn_device_h_l220_c2_a313] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8_uxn_device_h_l220_c2_a313_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_37d8(
     result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output;
     VAR_result_MUX_uxn_device_h_l220_c2_a313_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c6_a078_return_output;
     VAR_result_MUX_uxn_device_h_l220_c2_a313_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8_uxn_device_h_l220_c2_a313_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c1_0d67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output;

     -- Submodule level 2
     VAR_screen_deo_uxn_device_h_l221_c12_bb2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_0d67_return_output;
     -- screen_deo[uxn_device_h_l221_c12_bb2a] LATENCY=0
     -- Clock enable
     screen_deo_uxn_device_h_l221_c12_bb2a_CLOCK_ENABLE <= VAR_screen_deo_uxn_device_h_l221_c12_bb2a_CLOCK_ENABLE;
     -- Inputs
     screen_deo_uxn_device_h_l221_c12_bb2a_device_port <= VAR_screen_deo_uxn_device_h_l221_c12_bb2a_device_port;
     screen_deo_uxn_device_h_l221_c12_bb2a_phase <= VAR_screen_deo_uxn_device_h_l221_c12_bb2a_phase;
     screen_deo_uxn_device_h_l221_c12_bb2a_previous_device_ram_read <= VAR_screen_deo_uxn_device_h_l221_c12_bb2a_previous_device_ram_read;
     screen_deo_uxn_device_h_l221_c12_bb2a_previous_ram_read <= VAR_screen_deo_uxn_device_h_l221_c12_bb2a_previous_ram_read;
     -- Outputs
     VAR_screen_deo_uxn_device_h_l221_c12_bb2a_return_output := screen_deo_uxn_device_h_l221_c12_bb2a_return_output;

     -- Submodule level 3
     VAR_result_MUX_uxn_device_h_l220_c2_a313_iftrue := VAR_screen_deo_uxn_device_h_l221_c12_bb2a_return_output;
     -- result_MUX[uxn_device_h_l220_c2_a313] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c2_a313_cond <= VAR_result_MUX_uxn_device_h_l220_c2_a313_cond;
     result_MUX_uxn_device_h_l220_c2_a313_iftrue <= VAR_result_MUX_uxn_device_h_l220_c2_a313_iftrue;
     result_MUX_uxn_device_h_l220_c2_a313_iffalse <= VAR_result_MUX_uxn_device_h_l220_c2_a313_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c2_a313_return_output := result_MUX_uxn_device_h_l220_c2_a313_return_output;

     -- Submodule level 4
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l220_c2_a313_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l220_c2_a313_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
