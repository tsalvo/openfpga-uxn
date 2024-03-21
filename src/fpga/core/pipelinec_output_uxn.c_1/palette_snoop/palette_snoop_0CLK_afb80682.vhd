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
-- BIN_OP_EQ[uxn_c_l279_c21_9fe9]
signal BIN_OP_EQ_uxn_c_l279_c21_9fe9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c21_9fe9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l279_c21_9d36]
signal MUX_uxn_c_l279_c21_9d36_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l279_c21_9d36_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l279_c21_9d36_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l279_c21_9d36_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l281_c6_b136]
signal BIN_OP_AND_uxn_c_l281_c6_b136_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l281_c6_b136_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l281_c6_b136_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l281_c2_a90e]
signal color_MUX_uxn_c_l281_c2_a90e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l281_c2_a90e_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l281_c2_a90e_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l281_c2_a90e_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l282_c7_c745]
signal BIN_OP_EQ_uxn_c_l282_c7_c745_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c7_c745_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c7_c745_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l282_c3_f1d3]
signal color_MUX_uxn_c_l282_c3_f1d3_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l282_c3_f1d3_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l282_c3_f1d3_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l282_c3_f1d3_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l286_c12_c556]
signal BIN_OP_EQ_uxn_c_l286_c12_c556_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l286_c12_c556_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l286_c12_c556_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l286_c8_a28d]
signal color_MUX_uxn_c_l286_c8_a28d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l286_c8_a28d_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l286_c8_a28d_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l286_c8_a28d_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l290_c12_55f9]
signal BIN_OP_EQ_uxn_c_l290_c12_55f9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l290_c12_55f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l290_c8_8698]
signal color_MUX_uxn_c_l290_c8_8698_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l290_c8_8698_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l290_c8_8698_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l290_c8_8698_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l294_c12_6b9a]
signal BIN_OP_EQ_uxn_c_l294_c12_6b9a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l294_c12_6b9a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l294_c8_3096]
signal color_MUX_uxn_c_l294_c8_3096_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l294_c8_3096_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l294_c8_3096_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l294_c8_3096_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l298_c12_96c3]
signal BIN_OP_EQ_uxn_c_l298_c12_96c3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l298_c12_96c3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l298_c8_e7f3]
signal color_MUX_uxn_c_l298_c8_e7f3_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l298_c8_e7f3_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l298_c8_e7f3_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l298_c8_e7f3_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l302_c12_4dc3]
signal BIN_OP_EQ_uxn_c_l302_c12_4dc3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l302_c12_4dc3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l302_c8_dcc7]
signal color_2_MUX_uxn_c_l302_c8_dcc7_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l302_c8_dcc7_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l302_c8_dcc7_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l302_c8_dcc7_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l302_c8_dcc7]
signal color_3_MUX_uxn_c_l302_c8_dcc7_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l302_c8_dcc7_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l302_c8_dcc7_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l302_c8_dcc7_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l308_c9_7615]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output : unsigned(11 downto 0);

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
-- BIN_OP_EQ_uxn_c_l279_c21_9fe9
BIN_OP_EQ_uxn_c_l279_c21_9fe9 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l279_c21_9fe9_left,
BIN_OP_EQ_uxn_c_l279_c21_9fe9_right,
BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output);

-- MUX_uxn_c_l279_c21_9d36
MUX_uxn_c_l279_c21_9d36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l279_c21_9d36_cond,
MUX_uxn_c_l279_c21_9d36_iftrue,
MUX_uxn_c_l279_c21_9d36_iffalse,
MUX_uxn_c_l279_c21_9d36_return_output);

-- BIN_OP_AND_uxn_c_l281_c6_b136
BIN_OP_AND_uxn_c_l281_c6_b136 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c6_b136_left,
BIN_OP_AND_uxn_c_l281_c6_b136_right,
BIN_OP_AND_uxn_c_l281_c6_b136_return_output);

-- color_MUX_uxn_c_l281_c2_a90e
color_MUX_uxn_c_l281_c2_a90e : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l281_c2_a90e_cond,
color_MUX_uxn_c_l281_c2_a90e_iftrue,
color_MUX_uxn_c_l281_c2_a90e_iffalse,
color_MUX_uxn_c_l281_c2_a90e_return_output);

-- BIN_OP_EQ_uxn_c_l282_c7_c745
BIN_OP_EQ_uxn_c_l282_c7_c745 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l282_c7_c745_left,
BIN_OP_EQ_uxn_c_l282_c7_c745_right,
BIN_OP_EQ_uxn_c_l282_c7_c745_return_output);

-- color_MUX_uxn_c_l282_c3_f1d3
color_MUX_uxn_c_l282_c3_f1d3 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l282_c3_f1d3_cond,
color_MUX_uxn_c_l282_c3_f1d3_iftrue,
color_MUX_uxn_c_l282_c3_f1d3_iffalse,
color_MUX_uxn_c_l282_c3_f1d3_return_output);

-- BIN_OP_EQ_uxn_c_l286_c12_c556
BIN_OP_EQ_uxn_c_l286_c12_c556 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l286_c12_c556_left,
BIN_OP_EQ_uxn_c_l286_c12_c556_right,
BIN_OP_EQ_uxn_c_l286_c12_c556_return_output);

-- color_MUX_uxn_c_l286_c8_a28d
color_MUX_uxn_c_l286_c8_a28d : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l286_c8_a28d_cond,
color_MUX_uxn_c_l286_c8_a28d_iftrue,
color_MUX_uxn_c_l286_c8_a28d_iffalse,
color_MUX_uxn_c_l286_c8_a28d_return_output);

-- BIN_OP_EQ_uxn_c_l290_c12_55f9
BIN_OP_EQ_uxn_c_l290_c12_55f9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l290_c12_55f9_left,
BIN_OP_EQ_uxn_c_l290_c12_55f9_right,
BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output);

-- color_MUX_uxn_c_l290_c8_8698
color_MUX_uxn_c_l290_c8_8698 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l290_c8_8698_cond,
color_MUX_uxn_c_l290_c8_8698_iftrue,
color_MUX_uxn_c_l290_c8_8698_iffalse,
color_MUX_uxn_c_l290_c8_8698_return_output);

-- BIN_OP_EQ_uxn_c_l294_c12_6b9a
BIN_OP_EQ_uxn_c_l294_c12_6b9a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l294_c12_6b9a_left,
BIN_OP_EQ_uxn_c_l294_c12_6b9a_right,
BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output);

-- color_MUX_uxn_c_l294_c8_3096
color_MUX_uxn_c_l294_c8_3096 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l294_c8_3096_cond,
color_MUX_uxn_c_l294_c8_3096_iftrue,
color_MUX_uxn_c_l294_c8_3096_iffalse,
color_MUX_uxn_c_l294_c8_3096_return_output);

-- BIN_OP_EQ_uxn_c_l298_c12_96c3
BIN_OP_EQ_uxn_c_l298_c12_96c3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l298_c12_96c3_left,
BIN_OP_EQ_uxn_c_l298_c12_96c3_right,
BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output);

-- color_MUX_uxn_c_l298_c8_e7f3
color_MUX_uxn_c_l298_c8_e7f3 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l298_c8_e7f3_cond,
color_MUX_uxn_c_l298_c8_e7f3_iftrue,
color_MUX_uxn_c_l298_c8_e7f3_iffalse,
color_MUX_uxn_c_l298_c8_e7f3_return_output);

-- BIN_OP_EQ_uxn_c_l302_c12_4dc3
BIN_OP_EQ_uxn_c_l302_c12_4dc3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l302_c12_4dc3_left,
BIN_OP_EQ_uxn_c_l302_c12_4dc3_right,
BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output);

-- color_2_MUX_uxn_c_l302_c8_dcc7
color_2_MUX_uxn_c_l302_c8_dcc7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l302_c8_dcc7_cond,
color_2_MUX_uxn_c_l302_c8_dcc7_iftrue,
color_2_MUX_uxn_c_l302_c8_dcc7_iffalse,
color_2_MUX_uxn_c_l302_c8_dcc7_return_output);

-- color_3_MUX_uxn_c_l302_c8_dcc7
color_3_MUX_uxn_c_l302_c8_dcc7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l302_c8_dcc7_cond,
color_3_MUX_uxn_c_l302_c8_dcc7_iftrue,
color_3_MUX_uxn_c_l302_c8_dcc7_iffalse,
color_3_MUX_uxn_c_l302_c8_dcc7_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output);



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
 BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output,
 MUX_uxn_c_l279_c21_9d36_return_output,
 BIN_OP_AND_uxn_c_l281_c6_b136_return_output,
 color_MUX_uxn_c_l281_c2_a90e_return_output,
 BIN_OP_EQ_uxn_c_l282_c7_c745_return_output,
 color_MUX_uxn_c_l282_c3_f1d3_return_output,
 BIN_OP_EQ_uxn_c_l286_c12_c556_return_output,
 color_MUX_uxn_c_l286_c8_a28d_return_output,
 BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output,
 color_MUX_uxn_c_l290_c8_8698_return_output,
 BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output,
 color_MUX_uxn_c_l294_c8_3096_return_output,
 BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output,
 color_MUX_uxn_c_l298_c8_e7f3_return_output,
 BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output,
 color_2_MUX_uxn_c_l302_c8_dcc7_return_output,
 color_3_MUX_uxn_c_l302_c8_dcc7_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_uint8_7_4_uxn_c_l275_c23_bedb_return_output : unsigned(3 downto 0);
 variable VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output : unsigned(3 downto 0);
 variable VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_9d36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_9d36_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_9d36_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l279_c21_9d36_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c6_b136_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c6_b136_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c6_b136_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l281_c2_a90e_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l282_c3_f1d3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c2_a90e_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c2_a90e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c2_a90e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l282_c3_f1d3_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l282_c3_f1d3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l282_c3_f1d3_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l286_c8_a28d_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l282_c3_f1d3_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l283_c15_1c4a_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l284_c15_0ee3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l286_c8_a28d_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l286_c8_a28d_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l286_c8_a28d_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_8698_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l286_c8_a28d_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l287_c15_2c5d_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l288_c15_5b32_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l290_c8_8698_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l290_c8_8698_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_8698_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l294_c8_3096_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_8698_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l291_c15_3948_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l292_c15_da64_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l294_c8_3096_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l294_c8_3096_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l294_c8_3096_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l298_c8_e7f3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l294_c8_3096_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l295_c15_ad1c_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l296_c15_6aa1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l298_c8_e7f3_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l298_c8_e7f3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l298_c8_e7f3_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l298_c8_e7f3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l298_c8_e7f3_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l299_c15_c7ab_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l300_c15_d50e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_dcc7_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_dcc7_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_dcc7_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l302_c8_dcc7_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_dcc7_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_dcc7_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_dcc7_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l302_c8_dcc7_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l303_c15_030f_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l304_c15_4572_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l291_l283_DUPLICATE_3104_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l284_l292_DUPLICATE_4634_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f_return_output : unsigned(11 downto 0);
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
     VAR_MUX_uxn_c_l279_c21_9d36_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l279_c21_9d36_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_right := to_unsigned(11, 4);

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
     VAR_color_MUX_uxn_c_l281_c2_a90e_iffalse := color;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l281_c6_b136_left := VAR_is_device_ram_write;
     -- uint8_7_4[uxn_c_l277_c16_1119] LATENCY=0
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output := uint8_7_4(
     VAR_device_ram_value);

     -- uint8_7_4[uxn_c_l275_c23_bedb] LATENCY=0
     VAR_uint8_7_4_uxn_c_l275_c23_bedb_return_output := uint8_7_4(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l291_l283_DUPLICATE_3104 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l291_l283_DUPLICATE_3104_return_output := color(0);

     -- uint8_3_0[uxn_c_l278_c16_178f] LATENCY=0
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output := uint8_3_0(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l284_l292_DUPLICATE_4634 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l284_l292_DUPLICATE_4634_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f_return_output := color(3);

     -- uint8_3_0[uxn_c_l276_c23_c051] LATENCY=0
     VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output := uint8_3_0(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68_return_output := color(2);

     -- Submodule level 1
     VAR_color_2_MUX_uxn_c_l302_c8_dcc7_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68_return_output;
     VAR_color_3_MUX_uxn_c_l302_c8_dcc7_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f_return_output;
     VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_left := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_left := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_left := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_left := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_left := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_left := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     REG_VAR_device_ram_addr_lo := VAR_uint8_3_0_uxn_c_l276_c23_c051_return_output;
     REG_VAR_color_cmp_1 := VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output;
     VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_left := VAR_uint8_7_4_uxn_c_l275_c23_bedb_return_output;
     REG_VAR_device_ram_addr_hi := VAR_uint8_7_4_uxn_c_l275_c23_bedb_return_output;
     REG_VAR_color_cmp_0 := VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output;
     -- BIN_OP_EQ[uxn_c_l282_c7_c745] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l282_c7_c745_left <= VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_left;
     BIN_OP_EQ_uxn_c_l282_c7_c745_right <= VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_return_output := BIN_OP_EQ_uxn_c_l282_c7_c745_return_output;

     -- BIN_OP_EQ[uxn_c_l279_c21_9fe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l279_c21_9fe9_left <= VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_left;
     BIN_OP_EQ_uxn_c_l279_c21_9fe9_right <= VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output := BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output;

     -- BIN_OP_EQ[uxn_c_l290_c12_55f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l290_c12_55f9_left <= VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_left;
     BIN_OP_EQ_uxn_c_l290_c12_55f9_right <= VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output := BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output;

     -- BIN_OP_EQ[uxn_c_l302_c12_4dc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l302_c12_4dc3_left <= VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_left;
     BIN_OP_EQ_uxn_c_l302_c12_4dc3_right <= VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output := BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output;

     -- uint12_uint4_4[uxn_c_l292_c15_da64] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l292_c15_da64_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l284_l292_DUPLICATE_4634_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output);

     -- uint12_uint4_4[uxn_c_l291_c15_3948] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l291_c15_3948_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l291_l283_DUPLICATE_3104_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output);

     -- uint12_uint4_4[uxn_c_l296_c15_6aa1] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l296_c15_6aa1_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output);

     -- uint12_uint4_8[uxn_c_l287_c15_2c5d] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l287_c15_2c5d_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output);

     -- uint12_uint4_8[uxn_c_l284_c15_0ee3] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l284_c15_0ee3_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l284_l292_DUPLICATE_4634_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output);

     -- uint12_uint4_4[uxn_c_l295_c15_ad1c] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l295_c15_ad1c_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output);

     -- BIN_OP_EQ[uxn_c_l294_c12_6b9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l294_c12_6b9a_left <= VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_left;
     BIN_OP_EQ_uxn_c_l294_c12_6b9a_right <= VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output := BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output;

     -- uint12_uint4_0[uxn_c_l304_c15_4572] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l304_c15_4572_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output);

     -- uint12_uint4_0[uxn_c_l300_c15_d50e] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l300_c15_d50e_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l300_l284_l292_DUPLICATE_4634_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output);

     -- BIN_OP_EQ[uxn_c_l286_c12_c556] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l286_c12_c556_left <= VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_left;
     BIN_OP_EQ_uxn_c_l286_c12_c556_right <= VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_return_output := BIN_OP_EQ_uxn_c_l286_c12_c556_return_output;

     -- BIN_OP_EQ[uxn_c_l298_c12_96c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l298_c12_96c3_left <= VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_left;
     BIN_OP_EQ_uxn_c_l298_c12_96c3_right <= VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output := BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output;

     -- uint12_uint4_8[uxn_c_l283_c15_1c4a] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l283_c15_1c4a_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l291_l283_DUPLICATE_3104_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output);

     -- uint12_uint4_8[uxn_c_l288_c15_5b32] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l288_c15_5b32_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l288_l302_l296_l304_DUPLICATE_ad5f_return_output,
     VAR_uint8_3_0_uxn_c_l278_c16_178f_return_output);

     -- uint12_uint4_0[uxn_c_l299_c15_c7ab] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l299_c15_c7ab_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l299_l291_l283_DUPLICATE_3104_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output);

     -- uint12_uint4_0[uxn_c_l303_c15_030f] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l303_c15_030f_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l287_l302_l303_l295_DUPLICATE_bb68_return_output,
     VAR_uint8_7_4_uxn_c_l277_c16_1119_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_c_l279_c21_9d36_cond := VAR_BIN_OP_EQ_uxn_c_l279_c21_9fe9_return_output;
     VAR_color_MUX_uxn_c_l282_c3_f1d3_cond := VAR_BIN_OP_EQ_uxn_c_l282_c7_c745_return_output;
     VAR_color_MUX_uxn_c_l286_c8_a28d_cond := VAR_BIN_OP_EQ_uxn_c_l286_c12_c556_return_output;
     VAR_color_MUX_uxn_c_l290_c8_8698_cond := VAR_BIN_OP_EQ_uxn_c_l290_c12_55f9_return_output;
     VAR_color_MUX_uxn_c_l294_c8_3096_cond := VAR_BIN_OP_EQ_uxn_c_l294_c12_6b9a_return_output;
     VAR_color_MUX_uxn_c_l298_c8_e7f3_cond := VAR_BIN_OP_EQ_uxn_c_l298_c12_96c3_return_output;
     VAR_color_2_MUX_uxn_c_l302_c8_dcc7_cond := VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output;
     VAR_color_3_MUX_uxn_c_l302_c8_dcc7_cond := VAR_BIN_OP_EQ_uxn_c_l302_c12_4dc3_return_output;
     VAR_color_2_MUX_uxn_c_l302_c8_dcc7_iftrue := VAR_uint12_uint4_0_uxn_c_l303_c15_030f_return_output;
     VAR_color_3_MUX_uxn_c_l302_c8_dcc7_iftrue := VAR_uint12_uint4_0_uxn_c_l304_c15_4572_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l282_c3_f1d3] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l282_c3_f1d3_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_8_uxn_c_l283_c15_1c4a_return_output,
     VAR_uint12_uint4_8_uxn_c_l284_c15_0ee3_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l290_c8_8698] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l290_c8_8698_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_4_uxn_c_l291_c15_3948_return_output,
     VAR_uint12_uint4_4_uxn_c_l292_c15_da64_return_output);

     -- color_3_MUX[uxn_c_l302_c8_dcc7] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l302_c8_dcc7_cond <= VAR_color_3_MUX_uxn_c_l302_c8_dcc7_cond;
     color_3_MUX_uxn_c_l302_c8_dcc7_iftrue <= VAR_color_3_MUX_uxn_c_l302_c8_dcc7_iftrue;
     color_3_MUX_uxn_c_l302_c8_dcc7_iffalse <= VAR_color_3_MUX_uxn_c_l302_c8_dcc7_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l302_c8_dcc7_return_output := color_3_MUX_uxn_c_l302_c8_dcc7_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l298_c8_e7f3] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l298_c8_e7f3_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_0_uxn_c_l299_c15_c7ab_return_output,
     VAR_uint12_uint4_0_uxn_c_l300_c15_d50e_return_output);

     -- color_2_MUX[uxn_c_l302_c8_dcc7] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l302_c8_dcc7_cond <= VAR_color_2_MUX_uxn_c_l302_c8_dcc7_cond;
     color_2_MUX_uxn_c_l302_c8_dcc7_iftrue <= VAR_color_2_MUX_uxn_c_l302_c8_dcc7_iftrue;
     color_2_MUX_uxn_c_l302_c8_dcc7_iffalse <= VAR_color_2_MUX_uxn_c_l302_c8_dcc7_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l302_c8_dcc7_return_output := color_2_MUX_uxn_c_l302_c8_dcc7_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l286_c8_a28d] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l286_c8_a28d_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_uint12_uint4_8_uxn_c_l287_c15_2c5d_return_output,
     VAR_uint12_uint4_8_uxn_c_l288_c15_5b32_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l294_c8_3096] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l294_c8_3096_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_uint12_uint4_4_uxn_c_l295_c15_ad1c_return_output,
     VAR_uint12_uint4_4_uxn_c_l296_c15_6aa1_return_output);

     -- MUX[uxn_c_l279_c21_9d36] LATENCY=0
     -- Inputs
     MUX_uxn_c_l279_c21_9d36_cond <= VAR_MUX_uxn_c_l279_c21_9d36_cond;
     MUX_uxn_c_l279_c21_9d36_iftrue <= VAR_MUX_uxn_c_l279_c21_9d36_iftrue;
     MUX_uxn_c_l279_c21_9d36_iffalse <= VAR_MUX_uxn_c_l279_c21_9d36_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l279_c21_9d36_return_output := MUX_uxn_c_l279_c21_9d36_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l281_c6_b136_right := VAR_MUX_uxn_c_l279_c21_9d36_return_output;
     REG_VAR_is_palette_range := VAR_MUX_uxn_c_l279_c21_9d36_return_output;
     VAR_color_MUX_uxn_c_l282_c3_f1d3_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l282_c3_f1d3_return_output;
     VAR_color_MUX_uxn_c_l290_c8_8698_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l290_c8_8698_return_output;
     VAR_color_MUX_uxn_c_l298_c8_e7f3_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l298_c8_e7f3_return_output;
     VAR_color_MUX_uxn_c_l286_c8_a28d_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l286_c8_a28d_return_output;
     VAR_color_MUX_uxn_c_l294_c8_3096_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l294_c8_3096_return_output;
     -- BIN_OP_AND[uxn_c_l281_c6_b136] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c6_b136_left <= VAR_BIN_OP_AND_uxn_c_l281_c6_b136_left;
     BIN_OP_AND_uxn_c_l281_c6_b136_right <= VAR_BIN_OP_AND_uxn_c_l281_c6_b136_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c6_b136_return_output := BIN_OP_AND_uxn_c_l281_c6_b136_return_output;

     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l298_c8_e7f3] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l298_c8_e7f3_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l302_c8_dcc7_return_output,
     VAR_color_3_MUX_uxn_c_l302_c8_dcc7_return_output);

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l281_c2_a90e_cond := VAR_BIN_OP_AND_uxn_c_l281_c6_b136_return_output;
     VAR_color_MUX_uxn_c_l298_c8_e7f3_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l298_c8_e7f3_return_output;
     -- color_MUX[uxn_c_l298_c8_e7f3] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l298_c8_e7f3_cond <= VAR_color_MUX_uxn_c_l298_c8_e7f3_cond;
     color_MUX_uxn_c_l298_c8_e7f3_iftrue <= VAR_color_MUX_uxn_c_l298_c8_e7f3_iftrue;
     color_MUX_uxn_c_l298_c8_e7f3_iffalse <= VAR_color_MUX_uxn_c_l298_c8_e7f3_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l298_c8_e7f3_return_output := color_MUX_uxn_c_l298_c8_e7f3_return_output;

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l294_c8_3096_iffalse := VAR_color_MUX_uxn_c_l298_c8_e7f3_return_output;
     -- color_MUX[uxn_c_l294_c8_3096] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l294_c8_3096_cond <= VAR_color_MUX_uxn_c_l294_c8_3096_cond;
     color_MUX_uxn_c_l294_c8_3096_iftrue <= VAR_color_MUX_uxn_c_l294_c8_3096_iftrue;
     color_MUX_uxn_c_l294_c8_3096_iffalse <= VAR_color_MUX_uxn_c_l294_c8_3096_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l294_c8_3096_return_output := color_MUX_uxn_c_l294_c8_3096_return_output;

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l290_c8_8698_iffalse := VAR_color_MUX_uxn_c_l294_c8_3096_return_output;
     -- color_MUX[uxn_c_l290_c8_8698] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l290_c8_8698_cond <= VAR_color_MUX_uxn_c_l290_c8_8698_cond;
     color_MUX_uxn_c_l290_c8_8698_iftrue <= VAR_color_MUX_uxn_c_l290_c8_8698_iftrue;
     color_MUX_uxn_c_l290_c8_8698_iffalse <= VAR_color_MUX_uxn_c_l290_c8_8698_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l290_c8_8698_return_output := color_MUX_uxn_c_l290_c8_8698_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l286_c8_a28d_iffalse := VAR_color_MUX_uxn_c_l290_c8_8698_return_output;
     -- color_MUX[uxn_c_l286_c8_a28d] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l286_c8_a28d_cond <= VAR_color_MUX_uxn_c_l286_c8_a28d_cond;
     color_MUX_uxn_c_l286_c8_a28d_iftrue <= VAR_color_MUX_uxn_c_l286_c8_a28d_iftrue;
     color_MUX_uxn_c_l286_c8_a28d_iffalse <= VAR_color_MUX_uxn_c_l286_c8_a28d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l286_c8_a28d_return_output := color_MUX_uxn_c_l286_c8_a28d_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l282_c3_f1d3_iffalse := VAR_color_MUX_uxn_c_l286_c8_a28d_return_output;
     -- color_MUX[uxn_c_l282_c3_f1d3] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l282_c3_f1d3_cond <= VAR_color_MUX_uxn_c_l282_c3_f1d3_cond;
     color_MUX_uxn_c_l282_c3_f1d3_iftrue <= VAR_color_MUX_uxn_c_l282_c3_f1d3_iftrue;
     color_MUX_uxn_c_l282_c3_f1d3_iffalse <= VAR_color_MUX_uxn_c_l282_c3_f1d3_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l282_c3_f1d3_return_output := color_MUX_uxn_c_l282_c3_f1d3_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l281_c2_a90e_iftrue := VAR_color_MUX_uxn_c_l282_c3_f1d3_return_output;
     -- color_MUX[uxn_c_l281_c2_a90e] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l281_c2_a90e_cond <= VAR_color_MUX_uxn_c_l281_c2_a90e_cond;
     color_MUX_uxn_c_l281_c2_a90e_iftrue <= VAR_color_MUX_uxn_c_l281_c2_a90e_iftrue;
     color_MUX_uxn_c_l281_c2_a90e_iffalse <= VAR_color_MUX_uxn_c_l281_c2_a90e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l281_c2_a90e_return_output := color_MUX_uxn_c_l281_c2_a90e_return_output;

     -- Submodule level 10
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_ref_toks_0 := VAR_color_MUX_uxn_c_l281_c2_a90e_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l281_c2_a90e_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l308_c9_7615] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output;

     -- Submodule level 11
     VAR_return_output := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l308_c9_7615_return_output, 16);
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
