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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 9
entity step_boot_0CLK_e08689a7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out boot_step_result_t);
end step_boot_0CLK_e08689a7;
architecture arch of step_boot_0CLK_e08689a7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal boot_phase : unsigned(0 downto 0) := to_unsigned(0, 1);
signal rom_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : boot_step_result_t := (
is_valid_byte => to_unsigned(0, 1),
is_finished => to_unsigned(0, 1),
rom_byte => to_unsigned(0, 8),
ram_address => to_unsigned(254, 16))
;
signal REG_COMB_boot_phase : unsigned(0 downto 0);
signal REG_COMB_rom_address : unsigned(15 downto 0);
signal REG_COMB_result : boot_step_result_t;

-- Each function instance gets signals
-- read_rom_byte[uxn_c_l33_c20_34d7]
signal read_rom_byte_uxn_c_l33_c20_34d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l33_c20_34d7_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l33_c20_34d7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l34_c2_4a55]
signal BIN_OP_PLUS_uxn_c_l34_c2_4a55_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l34_c2_4a55_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l35_c2_a359]
signal BIN_OP_PLUS_uxn_c_l35_c2_a359_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l35_c2_a359_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c23_efc8]
signal BIN_OP_EQ_uxn_c_l36_c23_efc8_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c23_efc8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l36_c46_6e47]
signal BIN_OP_GT_uxn_c_l36_c46_6e47_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l36_c46_6e47_right : unsigned(9 downto 0);
signal BIN_OP_GT_uxn_c_l36_c46_6e47_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l36_c46_883b]
signal MUX_uxn_c_l36_c46_883b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l36_c46_883b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l36_c46_883b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l36_c46_883b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l36_c23_11d9]
signal MUX_uxn_c_l36_c23_11d9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l36_c23_11d9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l36_c23_11d9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l36_c23_11d9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l38_c2_982d]
signal BIN_OP_PLUS_uxn_c_l38_c2_982d_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c2_982d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output : unsigned(1 downto 0);

function CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return boot_step_result_t is
 
  variable base : boot_step_result_t; 
  variable return_output : boot_step_result_t;
begin
      base.rom_byte := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_finished := ref_toks_2;
      base.is_valid_byte := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- read_rom_byte_uxn_c_l33_c20_34d7
read_rom_byte_uxn_c_l33_c20_34d7 : entity work.read_rom_byte_0CLK_23f04728 port map (
clk,
read_rom_byte_uxn_c_l33_c20_34d7_CLOCK_ENABLE,
read_rom_byte_uxn_c_l33_c20_34d7_read_address,
read_rom_byte_uxn_c_l33_c20_34d7_return_output);

-- BIN_OP_PLUS_uxn_c_l34_c2_4a55
BIN_OP_PLUS_uxn_c_l34_c2_4a55 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l34_c2_4a55_left,
BIN_OP_PLUS_uxn_c_l34_c2_4a55_right,
BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output);

-- BIN_OP_PLUS_uxn_c_l35_c2_a359
BIN_OP_PLUS_uxn_c_l35_c2_a359 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l35_c2_a359_left,
BIN_OP_PLUS_uxn_c_l35_c2_a359_right,
BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output);

-- BIN_OP_EQ_uxn_c_l36_c23_efc8
BIN_OP_EQ_uxn_c_l36_c23_efc8 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c23_efc8_left,
BIN_OP_EQ_uxn_c_l36_c23_efc8_right,
BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output);

-- BIN_OP_GT_uxn_c_l36_c46_6e47
BIN_OP_GT_uxn_c_l36_c46_6e47 : entity work.BIN_OP_GT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l36_c46_6e47_left,
BIN_OP_GT_uxn_c_l36_c46_6e47_right,
BIN_OP_GT_uxn_c_l36_c46_6e47_return_output);

-- MUX_uxn_c_l36_c46_883b
MUX_uxn_c_l36_c46_883b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l36_c46_883b_cond,
MUX_uxn_c_l36_c46_883b_iftrue,
MUX_uxn_c_l36_c46_883b_iffalse,
MUX_uxn_c_l36_c46_883b_return_output);

-- MUX_uxn_c_l36_c23_11d9
MUX_uxn_c_l36_c23_11d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l36_c23_11d9_cond,
MUX_uxn_c_l36_c23_11d9_iftrue,
MUX_uxn_c_l36_c23_11d9_iffalse,
MUX_uxn_c_l36_c23_11d9_return_output);

-- BIN_OP_PLUS_uxn_c_l38_c2_982d
BIN_OP_PLUS_uxn_c_l38_c2_982d : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l38_c2_982d_left,
BIN_OP_PLUS_uxn_c_l38_c2_982d_right,
BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 boot_phase,
 rom_address,
 result,
 -- All submodule outputs
 read_rom_byte_uxn_c_l33_c20_34d7_return_output,
 BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output,
 BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output,
 BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output,
 BIN_OP_GT_uxn_c_l36_c46_6e47_return_output,
 MUX_uxn_c_l36_c46_883b_return_output,
 MUX_uxn_c_l36_c23_11d9_return_output,
 BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_read_rom_byte_uxn_c_l33_c20_34d7_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l33_c20_34d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l33_c20_34d7_return_output : unsigned(7 downto 0);
 variable VAR_rom_address_uxn_c_l34_c2_3d1d : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output : unsigned(16 downto 0);
 variable VAR_result_ram_address_uxn_c_l35_c2_1ca4 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l35_c2_1ca4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l36_c23_11d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c23_11d9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c23_11d9_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c46_883b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c46_883b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c46_883b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c46_883b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l36_c23_11d9_return_output : unsigned(0 downto 0);
 variable VAR_boot_phase_uxn_c_l38_c2_b640 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l40_l28_DUPLICATE_2c53_return_output : boot_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_boot_phase : unsigned(0 downto 0);
variable REG_VAR_rom_address : unsigned(15 downto 0);
variable REG_VAR_result : boot_step_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_boot_phase := boot_phase;
  REG_VAR_rom_address := rom_address;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_right := resize(to_unsigned(511, 9), 10);
     VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l36_c46_883b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l36_c46_883b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l36_c23_11d9_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_read_rom_byte_uxn_c_l33_c20_34d7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_right := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_right := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_left := rom_address;
     VAR_read_rom_byte_uxn_c_l33_c20_34d7_read_address := rom_address;
     -- BIN_OP_PLUS[uxn_c_l34_c2_4a55] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l34_c2_4a55_left <= VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_left;
     BIN_OP_PLUS_uxn_c_l34_c2_4a55_right <= VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output := BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l35_c2_1ca4] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l35_c2_1ca4_return_output := result.ram_address;

     -- BIN_OP_EQ[uxn_c_l36_c23_efc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c23_efc8_left <= VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_left;
     BIN_OP_EQ_uxn_c_l36_c23_efc8_right <= VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output := BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output;

     -- BIN_OP_PLUS[uxn_c_l38_c2_982d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l38_c2_982d_left <= VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_left;
     BIN_OP_PLUS_uxn_c_l38_c2_982d_right <= VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output := BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output;

     -- read_rom_byte[uxn_c_l33_c20_34d7] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l33_c20_34d7_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l33_c20_34d7_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l33_c20_34d7_read_address <= VAR_read_rom_byte_uxn_c_l33_c20_34d7_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l33_c20_34d7_return_output := read_rom_byte_uxn_c_l33_c20_34d7_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l36_c23_11d9_cond := VAR_BIN_OP_EQ_uxn_c_l36_c23_efc8_return_output;
     VAR_rom_address_uxn_c_l34_c2_3d1d := resize(VAR_BIN_OP_PLUS_uxn_c_l34_c2_4a55_return_output, 16);
     VAR_boot_phase_uxn_c_l38_c2_b640 := resize(VAR_BIN_OP_PLUS_uxn_c_l38_c2_982d_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_left := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l35_c2_1ca4_return_output;
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l38_c2_b640;
     VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_left := VAR_rom_address_uxn_c_l34_c2_3d1d;
     REG_VAR_rom_address := VAR_rom_address_uxn_c_l34_c2_3d1d;
     -- BIN_OP_GT[uxn_c_l36_c46_6e47] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l36_c46_6e47_left <= VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_left;
     BIN_OP_GT_uxn_c_l36_c46_6e47_right <= VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_return_output := BIN_OP_GT_uxn_c_l36_c46_6e47_return_output;

     -- BIN_OP_PLUS[uxn_c_l35_c2_a359] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l35_c2_a359_left <= VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_left;
     BIN_OP_PLUS_uxn_c_l35_c2_a359_right <= VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output := BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l36_c46_883b_cond := VAR_BIN_OP_GT_uxn_c_l36_c46_6e47_return_output;
     VAR_result_ram_address_uxn_c_l35_c2_1ca4 := resize(VAR_BIN_OP_PLUS_uxn_c_l35_c2_a359_return_output, 16);
     -- MUX[uxn_c_l36_c46_883b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l36_c46_883b_cond <= VAR_MUX_uxn_c_l36_c46_883b_cond;
     MUX_uxn_c_l36_c46_883b_iftrue <= VAR_MUX_uxn_c_l36_c46_883b_iftrue;
     MUX_uxn_c_l36_c46_883b_iffalse <= VAR_MUX_uxn_c_l36_c46_883b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l36_c46_883b_return_output := MUX_uxn_c_l36_c46_883b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l36_c23_11d9_iffalse := VAR_MUX_uxn_c_l36_c46_883b_return_output;
     -- MUX[uxn_c_l36_c23_11d9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l36_c23_11d9_cond <= VAR_MUX_uxn_c_l36_c23_11d9_cond;
     MUX_uxn_c_l36_c23_11d9_iftrue <= VAR_MUX_uxn_c_l36_c23_11d9_iftrue;
     MUX_uxn_c_l36_c23_11d9_iffalse <= VAR_MUX_uxn_c_l36_c23_11d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l36_c23_11d9_return_output := MUX_uxn_c_l36_c23_11d9_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l40_l28_DUPLICATE_2c53 LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l40_l28_DUPLICATE_2c53_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43(
     VAR_read_rom_byte_uxn_c_l33_c20_34d7_return_output,
     VAR_result_ram_address_uxn_c_l35_c2_1ca4,
     VAR_MUX_uxn_c_l36_c23_11d9_return_output,
     boot_phase);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l40_l28_DUPLICATE_2c53_return_output;
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l40_l28_DUPLICATE_2c53_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_boot_phase <= REG_VAR_boot_phase;
REG_COMB_rom_address <= REG_VAR_rom_address;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     boot_phase <= REG_COMB_boot_phase;
     rom_address <= REG_COMB_rom_address;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
