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
-- Submodules: 40
entity palette_snoop_0CLK_afb80682 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 gpu_step_color : in unsigned(1 downto 0);
 return_output : out unsigned(15 downto 0));
end palette_snoop_0CLK_afb80682;
architecture arch of palette_snoop_0CLK_afb80682 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal color : uint12_t_4 := (
0 => to_unsigned(4095, 12),
1 => to_unsigned(0, 12),
2 => to_unsigned(2011, 12),
3 => to_unsigned(3938, 12),
others => to_unsigned(0, 12))
;
signal device_ram_addr_lo : unsigned(3 downto 0) := to_unsigned(0, 4);
signal device_ram_addr_hi : unsigned(3 downto 0) := to_unsigned(0, 4);
signal color_cmp_0 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal color_cmp_1 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal is_palette_range : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_color : uint12_t_4;
signal REG_COMB_device_ram_addr_lo : unsigned(3 downto 0);
signal REG_COMB_device_ram_addr_hi : unsigned(3 downto 0);
signal REG_COMB_color_cmp_0 : unsigned(3 downto 0);
signal REG_COMB_color_cmp_1 : unsigned(3 downto 0);
signal REG_COMB_is_palette_range : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l279_c21_dfbf]
signal BIN_OP_EQ_uxn_c_l279_c21_dfbf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c21_dfbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l279_c21_4cfa]
signal MUX_uxn_c_l279_c21_4cfa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l279_c21_4cfa_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l279_c21_4cfa_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l279_c21_4cfa_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l281_c6_79e8]
signal BIN_OP_AND_uxn_c_l281_c6_79e8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l281_c6_79e8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l281_c6_79e8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l281_c2_1698]
signal color_MUX_uxn_c_l281_c2_1698_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l281_c2_1698_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l281_c2_1698_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l281_c2_1698_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l282_c7_0834]
signal BIN_OP_EQ_uxn_c_l282_c7_0834_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c7_0834_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c7_0834_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l282_c3_385b]
signal color_MUX_uxn_c_l282_c3_385b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l282_c3_385b_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l282_c3_385b_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l282_c3_385b_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l286_c12_8ca2]
signal BIN_OP_EQ_uxn_c_l286_c12_8ca2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l286_c12_8ca2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l286_c8_7df4]
signal color_MUX_uxn_c_l286_c8_7df4_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l286_c8_7df4_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l286_c8_7df4_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l286_c8_7df4_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l290_c12_8781]
signal BIN_OP_EQ_uxn_c_l290_c12_8781_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l290_c12_8781_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l290_c12_8781_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l290_c8_ea04]
signal color_MUX_uxn_c_l290_c8_ea04_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l290_c8_ea04_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l290_c8_ea04_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l290_c8_ea04_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l294_c12_2a94]
signal BIN_OP_EQ_uxn_c_l294_c12_2a94_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l294_c12_2a94_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l294_c8_add1]
signal color_MUX_uxn_c_l294_c8_add1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l294_c8_add1_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l294_c8_add1_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l294_c8_add1_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l298_c12_630a]
signal BIN_OP_EQ_uxn_c_l298_c12_630a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l298_c12_630a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l298_c12_630a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l298_c8_50f9]
signal color_MUX_uxn_c_l298_c8_50f9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l298_c8_50f9_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l298_c8_50f9_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l298_c8_50f9_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l302_c12_bf5d]
signal BIN_OP_EQ_uxn_c_l302_c12_bf5d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l302_c12_bf5d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l302_c8_9a67]
signal color_2_MUX_uxn_c_l302_c8_9a67_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l302_c8_9a67_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l302_c8_9a67_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l302_c8_9a67_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l302_c8_9a67]
signal color_3_MUX_uxn_c_l302_c8_9a67_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l302_c8_9a67_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l302_c8_9a67_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l302_c8_9a67_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l308_c9_2c48]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output : unsigned(11 downto 0);

function uint8_7_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 4)));
return return_output;
end function;

function uint8_3_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(3 downto 0)));
return return_output;
end function;

function uint12_uint4_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(11 downto 0);
  --variable x : unsigned(3 downto 0);
  variable intermediate : unsigned(11 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

    intermediate := (others => '0');
    intermediate(11 downto 0) := unsigned(inp);
    intermediate(11 downto 8) := x;
    
    return_output := intermediate(11 downto 0) ;
    
    return return_output;

end function;

function CONST_REF_RD_uint12_t_4_uint12_t_4_90b8( ref_toks_0 : uint12_t_4;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return uint12_t_4 is
 
  variable base : uint12_t_4; 
  variable return_output : uint12_t_4;
begin
      base := ref_toks_0;
      base(0) := ref_toks_1;
      base(1) := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5( ref_toks_0 : uint12_t_4;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return uint12_t_4 is
 
  variable base : uint12_t_4; 
  variable return_output : uint12_t_4;
begin
      base := ref_toks_0;
      base(2) := ref_toks_1;
      base(3) := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function uint12_uint4_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(11 downto 0);
  --variable x : unsigned(3 downto 0);
  variable intermediate : unsigned(11 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

    intermediate := (others => '0');
    intermediate(11 downto 0) := unsigned(inp);
    intermediate(7 downto 4) := x;
    
    return_output := intermediate(11 downto 0) ;
    
    return return_output;

end function;

function uint12_uint4_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(11 downto 0);
  --variable x : unsigned(3 downto 0);
  variable intermediate : unsigned(11 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

    intermediate := (others => '0');
    intermediate(11 downto 0) := unsigned(inp);
    intermediate(3 downto 0) := x;
    
    return_output := intermediate(11 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l279_c21_dfbf
BIN_OP_EQ_uxn_c_l279_c21_dfbf : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l279_c21_dfbf_left,
BIN_OP_EQ_uxn_c_l279_c21_dfbf_right,
BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output);

-- MUX_uxn_c_l279_c21_4cfa
MUX_uxn_c_l279_c21_4cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l279_c21_4cfa_cond,
MUX_uxn_c_l279_c21_4cfa_iftrue,
MUX_uxn_c_l279_c21_4cfa_iffalse,
MUX_uxn_c_l279_c21_4cfa_return_output);

-- BIN_OP_AND_uxn_c_l281_c6_79e8
BIN_OP_AND_uxn_c_l281_c6_79e8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c6_79e8_left,
BIN_OP_AND_uxn_c_l281_c6_79e8_right,
BIN_OP_AND_uxn_c_l281_c6_79e8_return_output);

-- color_MUX_uxn_c_l281_c2_1698
color_MUX_uxn_c_l281_c2_1698 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l281_c2_1698_cond,
color_MUX_uxn_c_l281_c2_1698_iftrue,
color_MUX_uxn_c_l281_c2_1698_iffalse,
color_MUX_uxn_c_l281_c2_1698_return_output);

-- BIN_OP_EQ_uxn_c_l282_c7_0834
BIN_OP_EQ_uxn_c_l282_c7_0834 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l282_c7_0834_left,
BIN_OP_EQ_uxn_c_l282_c7_0834_right,
BIN_OP_EQ_uxn_c_l282_c7_0834_return_output);

-- color_MUX_uxn_c_l282_c3_385b
color_MUX_uxn_c_l282_c3_385b : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l282_c3_385b_cond,
color_MUX_uxn_c_l282_c3_385b_iftrue,
color_MUX_uxn_c_l282_c3_385b_iffalse,
color_MUX_uxn_c_l282_c3_385b_return_output);

-- BIN_OP_EQ_uxn_c_l286_c12_8ca2
BIN_OP_EQ_uxn_c_l286_c12_8ca2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l286_c12_8ca2_left,
BIN_OP_EQ_uxn_c_l286_c12_8ca2_right,
BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output);

-- color_MUX_uxn_c_l286_c8_7df4
color_MUX_uxn_c_l286_c8_7df4 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l286_c8_7df4_cond,
color_MUX_uxn_c_l286_c8_7df4_iftrue,
color_MUX_uxn_c_l286_c8_7df4_iffalse,
color_MUX_uxn_c_l286_c8_7df4_return_output);

-- BIN_OP_EQ_uxn_c_l290_c12_8781
BIN_OP_EQ_uxn_c_l290_c12_8781 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l290_c12_8781_left,
BIN_OP_EQ_uxn_c_l290_c12_8781_right,
BIN_OP_EQ_uxn_c_l290_c12_8781_return_output);

-- color_MUX_uxn_c_l290_c8_ea04
color_MUX_uxn_c_l290_c8_ea04 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l290_c8_ea04_cond,
color_MUX_uxn_c_l290_c8_ea04_iftrue,
color_MUX_uxn_c_l290_c8_ea04_iffalse,
color_MUX_uxn_c_l290_c8_ea04_return_output);

-- BIN_OP_EQ_uxn_c_l294_c12_2a94
BIN_OP_EQ_uxn_c_l294_c12_2a94 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l294_c12_2a94_left,
BIN_OP_EQ_uxn_c_l294_c12_2a94_right,
BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output);

-- color_MUX_uxn_c_l294_c8_add1
color_MUX_uxn_c_l294_c8_add1 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l294_c8_add1_cond,
color_MUX_uxn_c_l294_c8_add1_iftrue,
color_MUX_uxn_c_l294_c8_add1_iffalse,
color_MUX_uxn_c_l294_c8_add1_return_output);

-- BIN_OP_EQ_uxn_c_l298_c12_630a
BIN_OP_EQ_uxn_c_l298_c12_630a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l298_c12_630a_left,
BIN_OP_EQ_uxn_c_l298_c12_630a_right,
BIN_OP_EQ_uxn_c_l298_c12_630a_return_output);

-- color_MUX_uxn_c_l298_c8_50f9
color_MUX_uxn_c_l298_c8_50f9 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l298_c8_50f9_cond,
color_MUX_uxn_c_l298_c8_50f9_iftrue,
color_MUX_uxn_c_l298_c8_50f9_iffalse,
color_MUX_uxn_c_l298_c8_50f9_return_output);

-- BIN_OP_EQ_uxn_c_l302_c12_bf5d
BIN_OP_EQ_uxn_c_l302_c12_bf5d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l302_c12_bf5d_left,
BIN_OP_EQ_uxn_c_l302_c12_bf5d_right,
BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output);

-- color_2_MUX_uxn_c_l302_c8_9a67
color_2_MUX_uxn_c_l302_c8_9a67 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l302_c8_9a67_cond,
color_2_MUX_uxn_c_l302_c8_9a67_iftrue,
color_2_MUX_uxn_c_l302_c8_9a67_iffalse,
color_2_MUX_uxn_c_l302_c8_9a67_return_output);

-- color_3_MUX_uxn_c_l302_c8_9a67
color_3_MUX_uxn_c_l302_c8_9a67 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l302_c8_9a67_cond,
color_3_MUX_uxn_c_l302_c8_9a67_iftrue,
color_3_MUX_uxn_c_l302_c8_9a67_iffalse,
color_3_MUX_uxn_c_l302_c8_9a67_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 gpu_step_color,
 -- Registers
 color,
 device_ram_addr_lo,
 device_ram_addr_hi,
 color_cmp_0,
 color_cmp_1,
 is_palette_range,
 -- All submodule outputs
 BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output,
 MUX_uxn_c_l279_c21_4cfa_return_output,
 BIN_OP_AND_uxn_c_l281_c6_79e8_return_output,
 color_MUX_uxn_c_l281_c2_1698_return_output,
 BIN_OP_EQ_uxn_c_l282_c7_0834_return_output,
 color_MUX_uxn_c_l282_c3_385b_return_output,
 BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output,
 color_MUX_uxn_c_l286_c8_7df4_return_output,
 BIN_OP_EQ_uxn_c_l290_c12_8781_return_output,
 color_MUX_uxn_c_l290_c8_ea04_return_output,
 BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output,
 color_MUX_uxn_c_l294_c8_add1_return_output,
 BIN_OP_EQ_uxn_c_l298_c12_630a_return_output,
 color_MUX_uxn_c_l298_c8_50f9_return_output,
 BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output,
 color_2_MUX_uxn_c_l302_c8_9a67_return_output,
 color_3_MUX_uxn_c_l302_c8_9a67_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_uint8_7_4_uxn_c_l275_c23_5357_return_output : unsigned(3 downto 0);
 variable VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output : unsigned(3 downto 0);
 variable VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_4cfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_4cfa_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_4cfa_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_4cfa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l281_c2_1698_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l282_c3_385b_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c2_1698_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c2_1698_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c2_1698_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l282_c3_385b_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l282_c3_385b_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l282_c3_385b_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l286_c8_7df4_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l282_c3_385b_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l283_c15_f6ed_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l284_c15_2f5d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l286_c8_7df4_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l286_c8_7df4_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l286_c8_7df4_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_ea04_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l286_c8_7df4_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l287_c15_3cfc_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l288_c15_f3b6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l290_c8_ea04_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l290_c8_ea04_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_ea04_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l294_c8_add1_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_ea04_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l291_c15_aff8_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l292_c15_5fb3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l294_c8_add1_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l294_c8_add1_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l294_c8_add1_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l298_c8_50f9_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l294_c8_add1_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l295_c15_7f48_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l296_c15_0982_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l298_c8_50f9_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l298_c8_50f9_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l298_c8_50f9_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l298_c8_50f9_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l298_c8_50f9_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l299_c15_bb29_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l300_c15_05dd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_9a67_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_9a67_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_9a67_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_9a67_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_9a67_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_9a67_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_9a67_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_9a67_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l303_c15_5da9_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l304_c15_724d_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l283_l291_DUPLICATE_bd66_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l292_l284_DUPLICATE_3b8f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
variable REG_VAR_device_ram_addr_lo : unsigned(3 downto 0);
variable REG_VAR_device_ram_addr_hi : unsigned(3 downto 0);
variable REG_VAR_color_cmp_0 : unsigned(3 downto 0);
variable REG_VAR_color_cmp_1 : unsigned(3 downto 0);
variable REG_VAR_is_palette_range : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
  REG_VAR_device_ram_addr_lo := device_ram_addr_lo;
  REG_VAR_device_ram_addr_hi := device_ram_addr_hi;
  REG_VAR_color_cmp_0 := color_cmp_0;
  REG_VAR_color_cmp_1 := color_cmp_1;
  REG_VAR_is_palette_range := is_palette_range;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l279_c21_4cfa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_right := to_unsigned(8, 4);
     VAR_MUX_uxn_c_l279_c21_4cfa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_ram_address := device_ram_address;
     VAR_device_ram_value := device_ram_value;
     VAR_is_device_ram_write := is_device_ram_write;
     VAR_gpu_step_color := gpu_step_color;

     -- Submodule level 0
     VAR_color_MUX_uxn_c_l281_c2_1698_iffalse := color;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l292_l284_DUPLICATE_3b8f LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l292_l284_DUPLICATE_3b8f_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l283_l291_DUPLICATE_bd66 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l283_l291_DUPLICATE_bd66_return_output := color(0);

     -- uint8_7_4[uxn_c_l277_c16_b004] LATENCY=0
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output := uint8_7_4(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853_return_output := color(3);

     -- uint8_3_0[uxn_c_l278_c16_70fc] LATENCY=0
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output := uint8_3_0(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41_return_output := color(2);

     -- uint8_7_4[uxn_c_l275_c23_5357] LATENCY=0
     VAR_uint8_7_4_uxn_c_l275_c23_5357_return_output := uint8_7_4(
     VAR_device_ram_address);

     -- uint8_3_0[uxn_c_l276_c23_4c7b] LATENCY=0
     VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output := uint8_3_0(
     VAR_device_ram_address);

     -- Submodule level 1
     VAR_color_2_MUX_uxn_c_l302_c8_9a67_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41_return_output;
     VAR_color_3_MUX_uxn_c_l302_c8_9a67_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853_return_output;
     VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_left := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_left := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_left := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_left := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_left := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_left := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     REG_VAR_device_ram_addr_lo := VAR_uint8_3_0_uxn_c_l276_c23_4c7b_return_output;
     REG_VAR_color_cmp_1 := VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output;
     VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_left := VAR_uint8_7_4_uxn_c_l275_c23_5357_return_output;
     REG_VAR_device_ram_addr_hi := VAR_uint8_7_4_uxn_c_l275_c23_5357_return_output;
     REG_VAR_color_cmp_0 := VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output;
     -- uint12_uint4_8[uxn_c_l288_c15_f3b6] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l288_c15_f3b6_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output);

     -- BIN_OP_EQ[uxn_c_l294_c12_2a94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l294_c12_2a94_left <= VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_left;
     BIN_OP_EQ_uxn_c_l294_c12_2a94_right <= VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output := BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output;

     -- BIN_OP_EQ[uxn_c_l302_c12_bf5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l302_c12_bf5d_left <= VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_left;
     BIN_OP_EQ_uxn_c_l302_c12_bf5d_right <= VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output := BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output;

     -- uint12_uint4_8[uxn_c_l284_c15_2f5d] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l284_c15_2f5d_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l292_l284_DUPLICATE_3b8f_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output);

     -- uint12_uint4_0[uxn_c_l300_c15_05dd] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l300_c15_05dd_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l292_l284_DUPLICATE_3b8f_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output);

     -- BIN_OP_EQ[uxn_c_l290_c12_8781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l290_c12_8781_left <= VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_left;
     BIN_OP_EQ_uxn_c_l290_c12_8781_right <= VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_return_output := BIN_OP_EQ_uxn_c_l290_c12_8781_return_output;

     -- BIN_OP_EQ[uxn_c_l286_c12_8ca2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l286_c12_8ca2_left <= VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_left;
     BIN_OP_EQ_uxn_c_l286_c12_8ca2_right <= VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output := BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output;

     -- uint12_uint4_4[uxn_c_l295_c15_7f48] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l295_c15_7f48_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output);

     -- BIN_OP_EQ[uxn_c_l279_c21_dfbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l279_c21_dfbf_left <= VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_left;
     BIN_OP_EQ_uxn_c_l279_c21_dfbf_right <= VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output := BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output;

     -- uint12_uint4_4[uxn_c_l291_c15_aff8] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l291_c15_aff8_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l283_l291_DUPLICATE_bd66_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output);

     -- uint12_uint4_0[uxn_c_l299_c15_bb29] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l299_c15_bb29_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l283_l291_DUPLICATE_bd66_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output);

     -- BIN_OP_EQ[uxn_c_l282_c7_0834] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l282_c7_0834_left <= VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_left;
     BIN_OP_EQ_uxn_c_l282_c7_0834_right <= VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_return_output := BIN_OP_EQ_uxn_c_l282_c7_0834_return_output;

     -- BIN_OP_EQ[uxn_c_l298_c12_630a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l298_c12_630a_left <= VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_left;
     BIN_OP_EQ_uxn_c_l298_c12_630a_right <= VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_return_output := BIN_OP_EQ_uxn_c_l298_c12_630a_return_output;

     -- uint12_uint4_4[uxn_c_l292_c15_5fb3] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l292_c15_5fb3_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l292_l284_DUPLICATE_3b8f_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output);

     -- uint12_uint4_0[uxn_c_l304_c15_724d] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l304_c15_724d_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output);

     -- uint12_uint4_8[uxn_c_l287_c15_3cfc] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l287_c15_3cfc_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output);

     -- uint12_uint4_8[uxn_c_l283_c15_f6ed] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l283_c15_f6ed_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l283_l291_DUPLICATE_bd66_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output);

     -- uint12_uint4_0[uxn_c_l303_c15_5da9] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l303_c15_5da9_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l303_l302_l295_DUPLICATE_fe41_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_b004_return_output);

     -- uint12_uint4_4[uxn_c_l296_c15_0982] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l296_c15_0982_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l304_l296_DUPLICATE_f853_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_70fc_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_c_l279_c21_4cfa_cond := VAR_BIN_OP_EQ_uxn_c_l279_c21_dfbf_return_output;
     VAR_color_MUX_uxn_c_l282_c3_385b_cond := VAR_BIN_OP_EQ_uxn_c_l282_c7_0834_return_output;
     VAR_color_MUX_uxn_c_l286_c8_7df4_cond := VAR_BIN_OP_EQ_uxn_c_l286_c12_8ca2_return_output;
     VAR_color_MUX_uxn_c_l290_c8_ea04_cond := VAR_BIN_OP_EQ_uxn_c_l290_c12_8781_return_output;
     VAR_color_MUX_uxn_c_l294_c8_add1_cond := VAR_BIN_OP_EQ_uxn_c_l294_c12_2a94_return_output;
     VAR_color_MUX_uxn_c_l298_c8_50f9_cond := VAR_BIN_OP_EQ_uxn_c_l298_c12_630a_return_output;
     VAR_color_2_MUX_uxn_c_l302_c8_9a67_cond := VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output;
     VAR_color_3_MUX_uxn_c_l302_c8_9a67_cond := VAR_BIN_OP_EQ_uxn_c_l302_c12_bf5d_return_output;
     VAR_color_2_MUX_uxn_c_l302_c8_9a67_iftrue := VAR_uint12_uint4_0_uxn_c_l303_c15_5da9_return_output;
     VAR_color_3_MUX_uxn_c_l302_c8_9a67_iftrue := VAR_uint12_uint4_0_uxn_c_l304_c15_724d_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l282_c3_385b] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l282_c3_385b_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_8_uxn_c_l283_c15_f6ed_return_output,
     VAR_uint12_uint4_8_uxn_c_l284_c15_2f5d_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l286_c8_7df4] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l286_c8_7df4_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_uint12_uint4_8_uxn_c_l287_c15_3cfc_return_output,
     VAR_uint12_uint4_8_uxn_c_l288_c15_f3b6_return_output);

     -- color_2_MUX[uxn_c_l302_c8_9a67] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l302_c8_9a67_cond <= VAR_color_2_MUX_uxn_c_l302_c8_9a67_cond;
     color_2_MUX_uxn_c_l302_c8_9a67_iftrue <= VAR_color_2_MUX_uxn_c_l302_c8_9a67_iftrue;
     color_2_MUX_uxn_c_l302_c8_9a67_iffalse <= VAR_color_2_MUX_uxn_c_l302_c8_9a67_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l302_c8_9a67_return_output := color_2_MUX_uxn_c_l302_c8_9a67_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l290_c8_ea04] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l290_c8_ea04_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_4_uxn_c_l291_c15_aff8_return_output,
     VAR_uint12_uint4_4_uxn_c_l292_c15_5fb3_return_output);

     -- color_3_MUX[uxn_c_l302_c8_9a67] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l302_c8_9a67_cond <= VAR_color_3_MUX_uxn_c_l302_c8_9a67_cond;
     color_3_MUX_uxn_c_l302_c8_9a67_iftrue <= VAR_color_3_MUX_uxn_c_l302_c8_9a67_iftrue;
     color_3_MUX_uxn_c_l302_c8_9a67_iffalse <= VAR_color_3_MUX_uxn_c_l302_c8_9a67_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l302_c8_9a67_return_output := color_3_MUX_uxn_c_l302_c8_9a67_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l294_c8_add1] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l294_c8_add1_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_uint12_uint4_4_uxn_c_l295_c15_7f48_return_output,
     VAR_uint12_uint4_4_uxn_c_l296_c15_0982_return_output);

     -- MUX[uxn_c_l279_c21_4cfa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l279_c21_4cfa_cond <= VAR_MUX_uxn_c_l279_c21_4cfa_cond;
     MUX_uxn_c_l279_c21_4cfa_iftrue <= VAR_MUX_uxn_c_l279_c21_4cfa_iftrue;
     MUX_uxn_c_l279_c21_4cfa_iffalse <= VAR_MUX_uxn_c_l279_c21_4cfa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l279_c21_4cfa_return_output := MUX_uxn_c_l279_c21_4cfa_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l298_c8_50f9] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l298_c8_50f9_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_0_uxn_c_l299_c15_bb29_return_output,
     VAR_uint12_uint4_0_uxn_c_l300_c15_05dd_return_output);

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_right := VAR_MUX_uxn_c_l279_c21_4cfa_return_output;
     REG_VAR_is_palette_range := VAR_MUX_uxn_c_l279_c21_4cfa_return_output;
     VAR_color_MUX_uxn_c_l282_c3_385b_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l282_c3_385b_return_output;
     VAR_color_MUX_uxn_c_l290_c8_ea04_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l290_c8_ea04_return_output;
     VAR_color_MUX_uxn_c_l298_c8_50f9_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l298_c8_50f9_return_output;
     VAR_color_MUX_uxn_c_l286_c8_7df4_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l286_c8_7df4_return_output;
     VAR_color_MUX_uxn_c_l294_c8_add1_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l294_c8_add1_return_output;
     -- BIN_OP_AND[uxn_c_l281_c6_79e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c6_79e8_left <= VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_left;
     BIN_OP_AND_uxn_c_l281_c6_79e8_right <= VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_return_output := BIN_OP_AND_uxn_c_l281_c6_79e8_return_output;

     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l298_c8_50f9] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l298_c8_50f9_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l302_c8_9a67_return_output,
     VAR_color_3_MUX_uxn_c_l302_c8_9a67_return_output);

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l281_c2_1698_cond := VAR_BIN_OP_AND_uxn_c_l281_c6_79e8_return_output;
     VAR_color_MUX_uxn_c_l298_c8_50f9_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l298_c8_50f9_return_output;
     -- color_MUX[uxn_c_l298_c8_50f9] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l298_c8_50f9_cond <= VAR_color_MUX_uxn_c_l298_c8_50f9_cond;
     color_MUX_uxn_c_l298_c8_50f9_iftrue <= VAR_color_MUX_uxn_c_l298_c8_50f9_iftrue;
     color_MUX_uxn_c_l298_c8_50f9_iffalse <= VAR_color_MUX_uxn_c_l298_c8_50f9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l298_c8_50f9_return_output := color_MUX_uxn_c_l298_c8_50f9_return_output;

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l294_c8_add1_iffalse := VAR_color_MUX_uxn_c_l298_c8_50f9_return_output;
     -- color_MUX[uxn_c_l294_c8_add1] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l294_c8_add1_cond <= VAR_color_MUX_uxn_c_l294_c8_add1_cond;
     color_MUX_uxn_c_l294_c8_add1_iftrue <= VAR_color_MUX_uxn_c_l294_c8_add1_iftrue;
     color_MUX_uxn_c_l294_c8_add1_iffalse <= VAR_color_MUX_uxn_c_l294_c8_add1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l294_c8_add1_return_output := color_MUX_uxn_c_l294_c8_add1_return_output;

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l290_c8_ea04_iffalse := VAR_color_MUX_uxn_c_l294_c8_add1_return_output;
     -- color_MUX[uxn_c_l290_c8_ea04] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l290_c8_ea04_cond <= VAR_color_MUX_uxn_c_l290_c8_ea04_cond;
     color_MUX_uxn_c_l290_c8_ea04_iftrue <= VAR_color_MUX_uxn_c_l290_c8_ea04_iftrue;
     color_MUX_uxn_c_l290_c8_ea04_iffalse <= VAR_color_MUX_uxn_c_l290_c8_ea04_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l290_c8_ea04_return_output := color_MUX_uxn_c_l290_c8_ea04_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l286_c8_7df4_iffalse := VAR_color_MUX_uxn_c_l290_c8_ea04_return_output;
     -- color_MUX[uxn_c_l286_c8_7df4] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l286_c8_7df4_cond <= VAR_color_MUX_uxn_c_l286_c8_7df4_cond;
     color_MUX_uxn_c_l286_c8_7df4_iftrue <= VAR_color_MUX_uxn_c_l286_c8_7df4_iftrue;
     color_MUX_uxn_c_l286_c8_7df4_iffalse <= VAR_color_MUX_uxn_c_l286_c8_7df4_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l286_c8_7df4_return_output := color_MUX_uxn_c_l286_c8_7df4_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l282_c3_385b_iffalse := VAR_color_MUX_uxn_c_l286_c8_7df4_return_output;
     -- color_MUX[uxn_c_l282_c3_385b] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l282_c3_385b_cond <= VAR_color_MUX_uxn_c_l282_c3_385b_cond;
     color_MUX_uxn_c_l282_c3_385b_iftrue <= VAR_color_MUX_uxn_c_l282_c3_385b_iftrue;
     color_MUX_uxn_c_l282_c3_385b_iffalse <= VAR_color_MUX_uxn_c_l282_c3_385b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l282_c3_385b_return_output := color_MUX_uxn_c_l282_c3_385b_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l281_c2_1698_iftrue := VAR_color_MUX_uxn_c_l282_c3_385b_return_output;
     -- color_MUX[uxn_c_l281_c2_1698] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l281_c2_1698_cond <= VAR_color_MUX_uxn_c_l281_c2_1698_cond;
     color_MUX_uxn_c_l281_c2_1698_iftrue <= VAR_color_MUX_uxn_c_l281_c2_1698_iftrue;
     color_MUX_uxn_c_l281_c2_1698_iffalse <= VAR_color_MUX_uxn_c_l281_c2_1698_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l281_c2_1698_return_output := color_MUX_uxn_c_l281_c2_1698_return_output;

     -- Submodule level 10
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_ref_toks_0 := VAR_color_MUX_uxn_c_l281_c2_1698_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l281_c2_1698_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l308_c9_2c48] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output;

     -- Submodule level 11
     VAR_return_output := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_2c48_return_output, 16);
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_color <= REG_VAR_color;
REG_COMB_device_ram_addr_lo <= REG_VAR_device_ram_addr_lo;
REG_COMB_device_ram_addr_hi <= REG_VAR_device_ram_addr_hi;
REG_COMB_color_cmp_0 <= REG_VAR_color_cmp_0;
REG_COMB_color_cmp_1 <= REG_VAR_color_cmp_1;
REG_COMB_is_palette_range <= REG_VAR_is_palette_range;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     color <= REG_COMB_color;
     device_ram_addr_lo <= REG_COMB_device_ram_addr_lo;
     device_ram_addr_hi <= REG_COMB_device_ram_addr_hi;
     color_cmp_0 <= REG_COMB_color_cmp_0;
     color_cmp_1 <= REG_COMB_color_cmp_1;
     is_palette_range <= REG_COMB_is_palette_range;
 end if;
 end if;
end process;

end arch;
