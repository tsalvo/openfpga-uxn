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
-- Submodules: 12
entity device_out_0CLK_45827a5f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_45827a5f;
architecture arch of device_out_0CLK_45827a5f is
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
signal device_index : unsigned(3 downto 0) := to_unsigned(0, 4);
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal deo_mask : uint1_t_16 := (
0 => to_unsigned(0, 1),
1 => to_unsigned(0, 1),
2 => to_unsigned(0, 1),
3 => to_unsigned(0, 1),
4 => to_unsigned(0, 1),
5 => to_unsigned(0, 1),
6 => to_unsigned(0, 1),
7 => to_unsigned(1, 1),
8 => to_unsigned(1, 1),
9 => to_unsigned(1, 1),
10 => to_unsigned(0, 1),
11 => to_unsigned(0, 1),
12 => to_unsigned(1, 1),
13 => to_unsigned(1, 1),
14 => to_unsigned(1, 1),
15 => to_unsigned(1, 1),
others => to_unsigned(0, 1))
;
signal REG_COMB_result : device_out_result_t;
signal REG_COMB_device_index : unsigned(3 downto 0);
signal REG_COMB_device_port : unsigned(3 downto 0);
signal REG_COMB_deo_mask : uint1_t_16;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l279_c6_a014]
signal BIN_OP_EQ_uxn_device_h_l279_c6_a014_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c6_a014_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l287_c1_04ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l279_c2_84a1]
signal device_index_MUX_uxn_device_h_l279_c2_84a1_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l279_c2_84a1_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l279_c2_84a1_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l279_c2_84a1_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l279_c2_84a1]
signal result_MUX_uxn_device_h_l279_c2_84a1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l279_c2_84a1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l279_c2_84a1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l279_c2_84a1_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l279_c2_84a1]
signal device_port_MUX_uxn_device_h_l279_c2_84a1_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l279_c2_84a1_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l279_c2_84a1_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l279_c2_84a1_return_output : unsigned(3 downto 0);

-- CONST_SR_4[uxn_device_h_l284_c28_ae2a]
signal CONST_SR_4_uxn_device_h_l284_c28_ae2a_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d[uxn_device_h_l285_c24_a0ee]
signal VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_ref_toks_0 : uint1_t_16;
signal VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l289_c47_1ff0]
signal BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l289_c12_64d3]
signal emu_deo_uxn_device_h_l289_c12_64d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l289_c12_64d3_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l289_c12_64d3_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l289_c12_64d3_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l289_c12_64d3_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l289_c12_64d3_previous_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l289_c12_64d3_return_output : device_out_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_e500( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_deo_done := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l279_c6_a014
BIN_OP_EQ_uxn_device_h_l279_c6_a014 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l279_c6_a014_left,
BIN_OP_EQ_uxn_device_h_l279_c6_a014_right,
BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output);

-- device_index_MUX_uxn_device_h_l279_c2_84a1
device_index_MUX_uxn_device_h_l279_c2_84a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l279_c2_84a1_cond,
device_index_MUX_uxn_device_h_l279_c2_84a1_iftrue,
device_index_MUX_uxn_device_h_l279_c2_84a1_iffalse,
device_index_MUX_uxn_device_h_l279_c2_84a1_return_output);

-- result_MUX_uxn_device_h_l279_c2_84a1
result_MUX_uxn_device_h_l279_c2_84a1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l279_c2_84a1_cond,
result_MUX_uxn_device_h_l279_c2_84a1_iftrue,
result_MUX_uxn_device_h_l279_c2_84a1_iffalse,
result_MUX_uxn_device_h_l279_c2_84a1_return_output);

-- device_port_MUX_uxn_device_h_l279_c2_84a1
device_port_MUX_uxn_device_h_l279_c2_84a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l279_c2_84a1_cond,
device_port_MUX_uxn_device_h_l279_c2_84a1_iftrue,
device_port_MUX_uxn_device_h_l279_c2_84a1_iffalse,
device_port_MUX_uxn_device_h_l279_c2_84a1_return_output);

-- CONST_SR_4_uxn_device_h_l284_c28_ae2a
CONST_SR_4_uxn_device_h_l284_c28_ae2a : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l284_c28_ae2a_x,
CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output);

-- VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee
VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee : entity work.VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_ref_toks_0,
VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_var_dim_0,
VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output);

-- BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0
BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_left,
BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_right,
BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output);

-- emu_deo_uxn_device_h_l289_c12_64d3
emu_deo_uxn_device_h_l289_c12_64d3 : entity work.emu_deo_0CLK_c92562d8 port map (
clk,
emu_deo_uxn_device_h_l289_c12_64d3_CLOCK_ENABLE,
emu_deo_uxn_device_h_l289_c12_64d3_device_index,
emu_deo_uxn_device_h_l289_c12_64d3_device_port,
emu_deo_uxn_device_h_l289_c12_64d3_phase,
emu_deo_uxn_device_h_l289_c12_64d3_previous_device_ram_read,
emu_deo_uxn_device_h_l289_c12_64d3_previous_ram_read,
emu_deo_uxn_device_h_l289_c12_64d3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 value,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 result,
 device_index,
 device_port,
 deo_mask,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output,
 device_index_MUX_uxn_device_h_l279_c2_84a1_return_output,
 result_MUX_uxn_device_h_l279_c2_84a1_return_output,
 device_port_MUX_uxn_device_h_l279_c2_84a1_return_output,
 CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output,
 VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output,
 BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output,
 emu_deo_uxn_device_h_l289_c12_64d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l279_c2_84a1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l279_c2_84a1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l279_c2_84a1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l279_c2_84a1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l279_c2_84a1_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l284_c28_ae2a_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l284_c18_e5b1_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output : unsigned(0 downto 0);
 variable VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_ref_toks_0 : uint1_t_16;
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l288_c17_e4aa_return_output : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l289_c12_64d3_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_out_result_t;
variable REG_VAR_device_index : unsigned(3 downto 0);
variable REG_VAR_device_port : unsigned(3 downto 0);
variable REG_VAR_deo_mask : uint1_t_16;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_index := device_index;
  REG_VAR_device_port := device_port;
  REG_VAR_deo_mask := deo_mask;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_value := value;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iffalse := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_CONST_SR_4_uxn_device_h_l284_c28_ae2a_x := VAR_device_address;
     VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_iftrue := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_left := VAR_phase;
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_previous_ram_read := VAR_previous_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l288_c17_e4aa] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l288_c17_e4aa_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- BIN_OP_MINUS[uxn_device_h_l289_c47_1ff0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_left <= VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_left;
     BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_right <= VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output := BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l279_c6_a014] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l279_c6_a014_left <= VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_left;
     BIN_OP_EQ_uxn_device_h_l279_c6_a014_right <= VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output := BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output;

     -- CONST_SR_4[uxn_device_h_l284_c28_ae2a] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l284_c28_ae2a_x <= VAR_CONST_SR_4_uxn_device_h_l284_c28_ae2a_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output := CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output;
     VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output;
     VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output;
     VAR_result_MUX_uxn_device_h_l279_c2_84a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c6_a014_return_output;
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_phase := VAR_BIN_OP_MINUS_uxn_device_h_l289_c47_1ff0_return_output;
     VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_iffalse := VAR_CAST_TO_uint4_t_uxn_device_h_l288_c17_e4aa_return_output;
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l288_c17_e4aa_return_output;
     -- CAST_TO_uint4_t[uxn_device_h_l284_c18_e5b1] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l284_c18_e5b1_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l284_c28_ae2a_return_output);

     -- device_port_MUX[uxn_device_h_l279_c2_84a1] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l279_c2_84a1_cond <= VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_cond;
     device_port_MUX_uxn_device_h_l279_c2_84a1_iftrue <= VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_iftrue;
     device_port_MUX_uxn_device_h_l279_c2_84a1_iffalse <= VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_return_output := device_port_MUX_uxn_device_h_l279_c2_84a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l287_c1_04ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output;

     -- Submodule level 2
     VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_var_dim_0 := VAR_CAST_TO_uint4_t_uxn_device_h_l284_c18_e5b1_return_output;
     VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l284_c18_e5b1_return_output;
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l287_c1_04ea_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l279_c2_84a1_return_output;
     -- device_index_MUX[uxn_device_h_l279_c2_84a1] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l279_c2_84a1_cond <= VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_cond;
     device_index_MUX_uxn_device_h_l279_c2_84a1_iftrue <= VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_iftrue;
     device_index_MUX_uxn_device_h_l279_c2_84a1_iffalse <= VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_return_output := device_index_MUX_uxn_device_h_l279_c2_84a1_return_output;

     -- emu_deo[uxn_device_h_l289_c12_64d3] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l289_c12_64d3_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l289_c12_64d3_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l289_c12_64d3_device_index <= VAR_emu_deo_uxn_device_h_l289_c12_64d3_device_index;
     emu_deo_uxn_device_h_l289_c12_64d3_device_port <= VAR_emu_deo_uxn_device_h_l289_c12_64d3_device_port;
     emu_deo_uxn_device_h_l289_c12_64d3_phase <= VAR_emu_deo_uxn_device_h_l289_c12_64d3_phase;
     emu_deo_uxn_device_h_l289_c12_64d3_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l289_c12_64d3_previous_device_ram_read;
     emu_deo_uxn_device_h_l289_c12_64d3_previous_ram_read <= VAR_emu_deo_uxn_device_h_l289_c12_64d3_previous_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l289_c12_64d3_return_output := emu_deo_uxn_device_h_l289_c12_64d3_return_output;

     -- VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d[uxn_device_h_l285_c24_a0ee] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_ref_toks_0 <= VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_ref_toks_0;
     VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_var_dim_0 <= VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output := VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output;

     -- Submodule level 3
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l279_c2_84a1_return_output;
     VAR_result_MUX_uxn_device_h_l279_c2_84a1_iffalse := VAR_emu_deo_uxn_device_h_l289_c12_64d3_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500[uxn_device_h_l279_c2_84a1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l279_c2_84a1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_e500(
     result,
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_VAR_REF_RD_uint1_t_uint1_t_16_VAR_d41d_uxn_device_h_l285_c24_a0ee_return_output);

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l279_c2_84a1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l279_c2_84a1_return_output;
     -- result_MUX[uxn_device_h_l279_c2_84a1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l279_c2_84a1_cond <= VAR_result_MUX_uxn_device_h_l279_c2_84a1_cond;
     result_MUX_uxn_device_h_l279_c2_84a1_iftrue <= VAR_result_MUX_uxn_device_h_l279_c2_84a1_iftrue;
     result_MUX_uxn_device_h_l279_c2_84a1_iffalse <= VAR_result_MUX_uxn_device_h_l279_c2_84a1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l279_c2_84a1_return_output := result_MUX_uxn_device_h_l279_c2_84a1_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l279_c2_84a1_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l279_c2_84a1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_index <= REG_VAR_device_index;
REG_COMB_device_port <= REG_VAR_device_port;
REG_COMB_deo_mask <= REG_VAR_deo_mask;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_index <= REG_COMB_device_index;
     device_port <= REG_COMB_device_port;
     deo_mask <= REG_COMB_deo_mask;
 end if;
 end if;
end process;

end arch;
