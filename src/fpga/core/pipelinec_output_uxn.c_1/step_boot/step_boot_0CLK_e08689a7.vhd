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
ram_address => to_unsigned(255, 16))
;
signal REG_COMB_boot_phase : unsigned(0 downto 0);
signal REG_COMB_rom_address : unsigned(15 downto 0);
signal REG_COMB_result : boot_step_result_t;

-- Each function instance gets signals
-- read_rom_byte[uxn_c_l32_c20_3eac]
signal read_rom_byte_uxn_c_l32_c20_3eac_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c20_3eac_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c20_3eac_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l33_c2_61bb]
signal BIN_OP_PLUS_uxn_c_l33_c2_61bb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l33_c2_61bb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l34_c2_1e57]
signal BIN_OP_PLUS_uxn_c_l34_c2_1e57_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l34_c2_1e57_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l35_c23_9abc]
signal BIN_OP_EQ_uxn_c_l35_c23_9abc_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l35_c23_9abc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l35_c46_8e89]
signal BIN_OP_GT_uxn_c_l35_c46_8e89_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l35_c46_8e89_right : unsigned(11 downto 0);
signal BIN_OP_GT_uxn_c_l35_c46_8e89_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l35_c46_afc5]
signal MUX_uxn_c_l35_c46_afc5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l35_c46_afc5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l35_c46_afc5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l35_c46_afc5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l35_c23_1ea8]
signal MUX_uxn_c_l35_c23_1ea8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l35_c23_1ea8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l35_c23_1ea8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l35_c23_1ea8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l37_c2_6b8a]
signal BIN_OP_PLUS_uxn_c_l37_c2_6b8a_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l37_c2_6b8a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output : unsigned(1 downto 0);

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
-- read_rom_byte_uxn_c_l32_c20_3eac
read_rom_byte_uxn_c_l32_c20_3eac : entity work.read_rom_byte_0CLK_23f04728 port map (
clk,
read_rom_byte_uxn_c_l32_c20_3eac_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c20_3eac_read_address,
read_rom_byte_uxn_c_l32_c20_3eac_return_output);

-- BIN_OP_PLUS_uxn_c_l33_c2_61bb
BIN_OP_PLUS_uxn_c_l33_c2_61bb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l33_c2_61bb_left,
BIN_OP_PLUS_uxn_c_l33_c2_61bb_right,
BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output);

-- BIN_OP_PLUS_uxn_c_l34_c2_1e57
BIN_OP_PLUS_uxn_c_l34_c2_1e57 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l34_c2_1e57_left,
BIN_OP_PLUS_uxn_c_l34_c2_1e57_right,
BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output);

-- BIN_OP_EQ_uxn_c_l35_c23_9abc
BIN_OP_EQ_uxn_c_l35_c23_9abc : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l35_c23_9abc_left,
BIN_OP_EQ_uxn_c_l35_c23_9abc_right,
BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output);

-- BIN_OP_GT_uxn_c_l35_c46_8e89
BIN_OP_GT_uxn_c_l35_c46_8e89 : entity work.BIN_OP_GT_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l35_c46_8e89_left,
BIN_OP_GT_uxn_c_l35_c46_8e89_right,
BIN_OP_GT_uxn_c_l35_c46_8e89_return_output);

-- MUX_uxn_c_l35_c46_afc5
MUX_uxn_c_l35_c46_afc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l35_c46_afc5_cond,
MUX_uxn_c_l35_c46_afc5_iftrue,
MUX_uxn_c_l35_c46_afc5_iffalse,
MUX_uxn_c_l35_c46_afc5_return_output);

-- MUX_uxn_c_l35_c23_1ea8
MUX_uxn_c_l35_c23_1ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l35_c23_1ea8_cond,
MUX_uxn_c_l35_c23_1ea8_iftrue,
MUX_uxn_c_l35_c23_1ea8_iffalse,
MUX_uxn_c_l35_c23_1ea8_return_output);

-- BIN_OP_PLUS_uxn_c_l37_c2_6b8a
BIN_OP_PLUS_uxn_c_l37_c2_6b8a : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l37_c2_6b8a_left,
BIN_OP_PLUS_uxn_c_l37_c2_6b8a_right,
BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 boot_phase,
 rom_address,
 result,
 -- All submodule outputs
 read_rom_byte_uxn_c_l32_c20_3eac_return_output,
 BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output,
 BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output,
 BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output,
 BIN_OP_GT_uxn_c_l35_c46_8e89_return_output,
 MUX_uxn_c_l35_c46_afc5_return_output,
 MUX_uxn_c_l35_c23_1ea8_return_output,
 BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_read_rom_byte_uxn_c_l32_c20_3eac_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c20_3eac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c20_3eac_return_output : unsigned(7 downto 0);
 variable VAR_rom_address_uxn_c_l33_c2_c857 : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output : unsigned(16 downto 0);
 variable VAR_result_ram_address_uxn_c_l34_c2_3ae4 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l34_c2_3ae4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l35_c23_1ea8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c23_1ea8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c23_1ea8_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c46_afc5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c46_afc5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c46_afc5_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c46_afc5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l35_c23_1ea8_return_output : unsigned(0 downto 0);
 variable VAR_boot_phase_uxn_c_l37_c2_0459 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l27_l39_DUPLICATE_ec8f_return_output : boot_step_result_t;
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
     VAR_MUX_uxn_c_l35_c46_afc5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l35_c46_afc5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_right := resize(to_unsigned(2047, 11), 12);
     VAR_MUX_uxn_c_l35_c23_1ea8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_read_rom_byte_uxn_c_l32_c20_3eac_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_right := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_right := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_left := rom_address;
     VAR_read_rom_byte_uxn_c_l32_c20_3eac_read_address := rom_address;
     -- read_rom_byte[uxn_c_l32_c20_3eac] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c20_3eac_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c20_3eac_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c20_3eac_read_address <= VAR_read_rom_byte_uxn_c_l32_c20_3eac_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c20_3eac_return_output := read_rom_byte_uxn_c_l32_c20_3eac_return_output;

     -- BIN_OP_EQ[uxn_c_l35_c23_9abc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l35_c23_9abc_left <= VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_left;
     BIN_OP_EQ_uxn_c_l35_c23_9abc_right <= VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output := BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l34_c2_3ae4] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l34_c2_3ae4_return_output := result.ram_address;

     -- BIN_OP_PLUS[uxn_c_l33_c2_61bb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l33_c2_61bb_left <= VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_left;
     BIN_OP_PLUS_uxn_c_l33_c2_61bb_right <= VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output := BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output;

     -- BIN_OP_PLUS[uxn_c_l37_c2_6b8a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l37_c2_6b8a_left <= VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_left;
     BIN_OP_PLUS_uxn_c_l37_c2_6b8a_right <= VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output := BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l35_c23_1ea8_cond := VAR_BIN_OP_EQ_uxn_c_l35_c23_9abc_return_output;
     VAR_rom_address_uxn_c_l33_c2_c857 := resize(VAR_BIN_OP_PLUS_uxn_c_l33_c2_61bb_return_output, 16);
     VAR_boot_phase_uxn_c_l37_c2_0459 := resize(VAR_BIN_OP_PLUS_uxn_c_l37_c2_6b8a_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_left := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l34_c2_3ae4_return_output;
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l37_c2_0459;
     VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_left := VAR_rom_address_uxn_c_l33_c2_c857;
     REG_VAR_rom_address := VAR_rom_address_uxn_c_l33_c2_c857;
     -- BIN_OP_PLUS[uxn_c_l34_c2_1e57] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l34_c2_1e57_left <= VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_left;
     BIN_OP_PLUS_uxn_c_l34_c2_1e57_right <= VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output := BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output;

     -- BIN_OP_GT[uxn_c_l35_c46_8e89] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l35_c46_8e89_left <= VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_left;
     BIN_OP_GT_uxn_c_l35_c46_8e89_right <= VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_return_output := BIN_OP_GT_uxn_c_l35_c46_8e89_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l35_c46_afc5_cond := VAR_BIN_OP_GT_uxn_c_l35_c46_8e89_return_output;
     VAR_result_ram_address_uxn_c_l34_c2_3ae4 := resize(VAR_BIN_OP_PLUS_uxn_c_l34_c2_1e57_return_output, 16);
     -- MUX[uxn_c_l35_c46_afc5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l35_c46_afc5_cond <= VAR_MUX_uxn_c_l35_c46_afc5_cond;
     MUX_uxn_c_l35_c46_afc5_iftrue <= VAR_MUX_uxn_c_l35_c46_afc5_iftrue;
     MUX_uxn_c_l35_c46_afc5_iffalse <= VAR_MUX_uxn_c_l35_c46_afc5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l35_c46_afc5_return_output := MUX_uxn_c_l35_c46_afc5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l35_c23_1ea8_iffalse := VAR_MUX_uxn_c_l35_c46_afc5_return_output;
     -- MUX[uxn_c_l35_c23_1ea8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l35_c23_1ea8_cond <= VAR_MUX_uxn_c_l35_c23_1ea8_cond;
     MUX_uxn_c_l35_c23_1ea8_iftrue <= VAR_MUX_uxn_c_l35_c23_1ea8_iftrue;
     MUX_uxn_c_l35_c23_1ea8_iffalse <= VAR_MUX_uxn_c_l35_c23_1ea8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l35_c23_1ea8_return_output := MUX_uxn_c_l35_c23_1ea8_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l27_l39_DUPLICATE_ec8f LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l27_l39_DUPLICATE_ec8f_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43(
     VAR_read_rom_byte_uxn_c_l32_c20_3eac_return_output,
     VAR_result_ram_address_uxn_c_l34_c2_3ae4,
     VAR_MUX_uxn_c_l35_c23_1ea8_return_output,
     boot_phase);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l27_l39_DUPLICATE_ec8f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_eb43_uxn_c_l27_l39_DUPLICATE_ec8f_return_output;
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
