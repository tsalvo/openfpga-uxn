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
-- BIN_OP_EQ[uxn_c_l278_c21_b234]
signal BIN_OP_EQ_uxn_c_l278_c21_b234_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c21_b234_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c21_b234_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l278_c21_040d]
signal MUX_uxn_c_l278_c21_040d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l278_c21_040d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l278_c21_040d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l278_c21_040d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l280_c6_edc3]
signal BIN_OP_AND_uxn_c_l280_c6_edc3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l280_c6_edc3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l280_c6_edc3_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l280_c2_8126]
signal color_MUX_uxn_c_l280_c2_8126_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l280_c2_8126_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l280_c2_8126_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l280_c2_8126_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l281_c7_04db]
signal BIN_OP_EQ_uxn_c_l281_c7_04db_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l281_c7_04db_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l281_c7_04db_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l281_c3_7fc4]
signal color_MUX_uxn_c_l281_c3_7fc4_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l281_c3_7fc4_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l281_c3_7fc4_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l281_c3_7fc4_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l285_c12_2394]
signal BIN_OP_EQ_uxn_c_l285_c12_2394_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l285_c12_2394_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l285_c12_2394_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l285_c8_cb92]
signal color_MUX_uxn_c_l285_c8_cb92_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l285_c8_cb92_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l285_c8_cb92_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l285_c8_cb92_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l289_c12_b025]
signal BIN_OP_EQ_uxn_c_l289_c12_b025_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_b025_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_b025_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l289_c8_6b77]
signal color_MUX_uxn_c_l289_c8_6b77_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l289_c8_6b77_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_6b77_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_6b77_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l293_c12_1e4a]
signal BIN_OP_EQ_uxn_c_l293_c12_1e4a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l293_c12_1e4a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l293_c8_2d7f]
signal color_MUX_uxn_c_l293_c8_2d7f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l293_c8_2d7f_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l293_c8_2d7f_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l293_c8_2d7f_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l297_c12_4017]
signal BIN_OP_EQ_uxn_c_l297_c12_4017_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l297_c12_4017_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l297_c12_4017_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l297_c8_b340]
signal color_MUX_uxn_c_l297_c8_b340_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l297_c8_b340_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l297_c8_b340_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l297_c8_b340_return_output : uint12_t_4;

-- BIN_OP_EQ[uxn_c_l301_c12_43df]
signal BIN_OP_EQ_uxn_c_l301_c12_43df_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l301_c12_43df_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l301_c12_43df_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l301_c8_835f]
signal color_2_MUX_uxn_c_l301_c8_835f_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l301_c8_835f_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l301_c8_835f_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l301_c8_835f_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l301_c8_835f]
signal color_3_MUX_uxn_c_l301_c8_835f_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l301_c8_835f_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l301_c8_835f_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l301_c8_835f_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l307_c9_8217]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output : unsigned(11 downto 0);

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
-- BIN_OP_EQ_uxn_c_l278_c21_b234
BIN_OP_EQ_uxn_c_l278_c21_b234 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c21_b234_left,
BIN_OP_EQ_uxn_c_l278_c21_b234_right,
BIN_OP_EQ_uxn_c_l278_c21_b234_return_output);

-- MUX_uxn_c_l278_c21_040d
MUX_uxn_c_l278_c21_040d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l278_c21_040d_cond,
MUX_uxn_c_l278_c21_040d_iftrue,
MUX_uxn_c_l278_c21_040d_iffalse,
MUX_uxn_c_l278_c21_040d_return_output);

-- BIN_OP_AND_uxn_c_l280_c6_edc3
BIN_OP_AND_uxn_c_l280_c6_edc3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l280_c6_edc3_left,
BIN_OP_AND_uxn_c_l280_c6_edc3_right,
BIN_OP_AND_uxn_c_l280_c6_edc3_return_output);

-- color_MUX_uxn_c_l280_c2_8126
color_MUX_uxn_c_l280_c2_8126 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l280_c2_8126_cond,
color_MUX_uxn_c_l280_c2_8126_iftrue,
color_MUX_uxn_c_l280_c2_8126_iffalse,
color_MUX_uxn_c_l280_c2_8126_return_output);

-- BIN_OP_EQ_uxn_c_l281_c7_04db
BIN_OP_EQ_uxn_c_l281_c7_04db : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l281_c7_04db_left,
BIN_OP_EQ_uxn_c_l281_c7_04db_right,
BIN_OP_EQ_uxn_c_l281_c7_04db_return_output);

-- color_MUX_uxn_c_l281_c3_7fc4
color_MUX_uxn_c_l281_c3_7fc4 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l281_c3_7fc4_cond,
color_MUX_uxn_c_l281_c3_7fc4_iftrue,
color_MUX_uxn_c_l281_c3_7fc4_iffalse,
color_MUX_uxn_c_l281_c3_7fc4_return_output);

-- BIN_OP_EQ_uxn_c_l285_c12_2394
BIN_OP_EQ_uxn_c_l285_c12_2394 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l285_c12_2394_left,
BIN_OP_EQ_uxn_c_l285_c12_2394_right,
BIN_OP_EQ_uxn_c_l285_c12_2394_return_output);

-- color_MUX_uxn_c_l285_c8_cb92
color_MUX_uxn_c_l285_c8_cb92 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l285_c8_cb92_cond,
color_MUX_uxn_c_l285_c8_cb92_iftrue,
color_MUX_uxn_c_l285_c8_cb92_iffalse,
color_MUX_uxn_c_l285_c8_cb92_return_output);

-- BIN_OP_EQ_uxn_c_l289_c12_b025
BIN_OP_EQ_uxn_c_l289_c12_b025 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c12_b025_left,
BIN_OP_EQ_uxn_c_l289_c12_b025_right,
BIN_OP_EQ_uxn_c_l289_c12_b025_return_output);

-- color_MUX_uxn_c_l289_c8_6b77
color_MUX_uxn_c_l289_c8_6b77 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l289_c8_6b77_cond,
color_MUX_uxn_c_l289_c8_6b77_iftrue,
color_MUX_uxn_c_l289_c8_6b77_iffalse,
color_MUX_uxn_c_l289_c8_6b77_return_output);

-- BIN_OP_EQ_uxn_c_l293_c12_1e4a
BIN_OP_EQ_uxn_c_l293_c12_1e4a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l293_c12_1e4a_left,
BIN_OP_EQ_uxn_c_l293_c12_1e4a_right,
BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output);

-- color_MUX_uxn_c_l293_c8_2d7f
color_MUX_uxn_c_l293_c8_2d7f : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l293_c8_2d7f_cond,
color_MUX_uxn_c_l293_c8_2d7f_iftrue,
color_MUX_uxn_c_l293_c8_2d7f_iffalse,
color_MUX_uxn_c_l293_c8_2d7f_return_output);

-- BIN_OP_EQ_uxn_c_l297_c12_4017
BIN_OP_EQ_uxn_c_l297_c12_4017 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l297_c12_4017_left,
BIN_OP_EQ_uxn_c_l297_c12_4017_right,
BIN_OP_EQ_uxn_c_l297_c12_4017_return_output);

-- color_MUX_uxn_c_l297_c8_b340
color_MUX_uxn_c_l297_c8_b340 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l297_c8_b340_cond,
color_MUX_uxn_c_l297_c8_b340_iftrue,
color_MUX_uxn_c_l297_c8_b340_iffalse,
color_MUX_uxn_c_l297_c8_b340_return_output);

-- BIN_OP_EQ_uxn_c_l301_c12_43df
BIN_OP_EQ_uxn_c_l301_c12_43df : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l301_c12_43df_left,
BIN_OP_EQ_uxn_c_l301_c12_43df_right,
BIN_OP_EQ_uxn_c_l301_c12_43df_return_output);

-- color_2_MUX_uxn_c_l301_c8_835f
color_2_MUX_uxn_c_l301_c8_835f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l301_c8_835f_cond,
color_2_MUX_uxn_c_l301_c8_835f_iftrue,
color_2_MUX_uxn_c_l301_c8_835f_iffalse,
color_2_MUX_uxn_c_l301_c8_835f_return_output);

-- color_3_MUX_uxn_c_l301_c8_835f
color_3_MUX_uxn_c_l301_c8_835f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l301_c8_835f_cond,
color_3_MUX_uxn_c_l301_c8_835f_iftrue,
color_3_MUX_uxn_c_l301_c8_835f_iffalse,
color_3_MUX_uxn_c_l301_c8_835f_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output);



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
 BIN_OP_EQ_uxn_c_l278_c21_b234_return_output,
 MUX_uxn_c_l278_c21_040d_return_output,
 BIN_OP_AND_uxn_c_l280_c6_edc3_return_output,
 color_MUX_uxn_c_l280_c2_8126_return_output,
 BIN_OP_EQ_uxn_c_l281_c7_04db_return_output,
 color_MUX_uxn_c_l281_c3_7fc4_return_output,
 BIN_OP_EQ_uxn_c_l285_c12_2394_return_output,
 color_MUX_uxn_c_l285_c8_cb92_return_output,
 BIN_OP_EQ_uxn_c_l289_c12_b025_return_output,
 color_MUX_uxn_c_l289_c8_6b77_return_output,
 BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output,
 color_MUX_uxn_c_l293_c8_2d7f_return_output,
 BIN_OP_EQ_uxn_c_l297_c12_4017_return_output,
 color_MUX_uxn_c_l297_c8_b340_return_output,
 BIN_OP_EQ_uxn_c_l301_c12_43df_return_output,
 color_2_MUX_uxn_c_l301_c8_835f_return_output,
 color_3_MUX_uxn_c_l301_c8_835f_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_uint8_7_4_uxn_c_l274_c23_1358_return_output : unsigned(3 downto 0);
 variable VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output : unsigned(3 downto 0);
 variable VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l278_c21_040d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l278_c21_040d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l278_c21_040d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l278_c21_040d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l280_c2_8126_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c3_7fc4_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l280_c2_8126_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l280_c2_8126_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l280_c2_8126_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l281_c3_7fc4_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l281_c3_7fc4_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c3_7fc4_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l285_c8_cb92_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l281_c3_7fc4_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l282_c15_0719_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l283_c15_89cf_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l285_c8_cb92_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l285_c8_cb92_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l285_c8_cb92_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6b77_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l285_c8_cb92_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l286_c15_a14c_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_8_uxn_c_l287_c15_5216_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l289_c8_6b77_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l289_c8_6b77_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6b77_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l293_c8_2d7f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6b77_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l290_c15_4c92_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l291_c15_e7d4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l293_c8_2d7f_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l293_c8_2d7f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l293_c8_2d7f_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l297_c8_b340_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l293_c8_2d7f_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l294_c15_b050_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_4_uxn_c_l295_c15_9025_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l297_c8_b340_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l297_c8_b340_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l297_c8_b340_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l297_c8_b340_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l297_c8_b340_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l298_c15_3215_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l299_c15_2cb4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l301_c8_835f_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l301_c8_835f_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l301_c8_835f_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l301_c8_835f_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l301_c8_835f_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l301_c8_835f_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l301_c8_835f_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l301_c8_835f_cond : unsigned(0 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l302_c15_b7e0_return_output : unsigned(11 downto 0);
 variable VAR_uint12_uint4_0_uxn_c_l303_c15_78e4_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l298_l290_l282_DUPLICATE_51aa_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l291_l299_l283_DUPLICATE_cae7_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_right := to_unsigned(13, 4);
     VAR_MUX_uxn_c_l278_c21_040d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_right := to_unsigned(10, 4);
     VAR_MUX_uxn_c_l278_c21_040d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_right := to_unsigned(12, 4);

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
     VAR_color_MUX_uxn_c_l280_c2_8126_iffalse := color;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l291_l299_l283_DUPLICATE_cae7 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l291_l299_l283_DUPLICATE_cae7_return_output := color(1);

     -- uint8_7_4[uxn_c_l276_c16_d2a7] LATENCY=0
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output := uint8_7_4(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l298_l290_l282_DUPLICATE_51aa LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l298_l290_l282_DUPLICATE_51aa_return_output := color(0);

     -- uint8_3_0[uxn_c_l277_c16_8e7d] LATENCY=0
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output := uint8_3_0(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c_return_output := color(3);

     -- uint8_3_0[uxn_c_l275_c23_ded1] LATENCY=0
     VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output := uint8_3_0(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f_return_output := color(2);

     -- uint8_7_4[uxn_c_l274_c23_1358] LATENCY=0
     VAR_uint8_7_4_uxn_c_l274_c23_1358_return_output := uint8_7_4(
     VAR_device_ram_address);

     -- Submodule level 1
     VAR_color_2_MUX_uxn_c_l301_c8_835f_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f_return_output;
     VAR_color_3_MUX_uxn_c_l301_c8_835f_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_left := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_left := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_left := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_left := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_left := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_left := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     REG_VAR_device_ram_addr_lo := VAR_uint8_3_0_uxn_c_l275_c23_ded1_return_output;
     REG_VAR_color_cmp_1 := VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_left := VAR_uint8_7_4_uxn_c_l274_c23_1358_return_output;
     REG_VAR_device_ram_addr_hi := VAR_uint8_7_4_uxn_c_l274_c23_1358_return_output;
     REG_VAR_color_cmp_0 := VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output;
     -- BIN_OP_EQ[uxn_c_l301_c12_43df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l301_c12_43df_left <= VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_left;
     BIN_OP_EQ_uxn_c_l301_c12_43df_right <= VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_return_output := BIN_OP_EQ_uxn_c_l301_c12_43df_return_output;

     -- uint12_uint4_8[uxn_c_l282_c15_0719] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l282_c15_0719_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l298_l290_l282_DUPLICATE_51aa_return_output,
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output);

     -- uint12_uint4_4[uxn_c_l294_c15_b050] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l294_c15_b050_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f_return_output,
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output);

     -- BIN_OP_EQ[uxn_c_l281_c7_04db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l281_c7_04db_left <= VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_left;
     BIN_OP_EQ_uxn_c_l281_c7_04db_right <= VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_return_output := BIN_OP_EQ_uxn_c_l281_c7_04db_return_output;

     -- BIN_OP_EQ[uxn_c_l297_c12_4017] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l297_c12_4017_left <= VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_left;
     BIN_OP_EQ_uxn_c_l297_c12_4017_right <= VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_return_output := BIN_OP_EQ_uxn_c_l297_c12_4017_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c21_b234] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c21_b234_left <= VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_left;
     BIN_OP_EQ_uxn_c_l278_c21_b234_right <= VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_return_output := BIN_OP_EQ_uxn_c_l278_c21_b234_return_output;

     -- uint12_uint4_4[uxn_c_l291_c15_e7d4] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l291_c15_e7d4_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l291_l299_l283_DUPLICATE_cae7_return_output,
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output);

     -- uint12_uint4_0[uxn_c_l302_c15_b7e0] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l302_c15_b7e0_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f_return_output,
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output);

     -- uint12_uint4_4[uxn_c_l295_c15_9025] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l295_c15_9025_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c_return_output,
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output);

     -- uint12_uint4_0[uxn_c_l298_c15_3215] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l298_c15_3215_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l298_l290_l282_DUPLICATE_51aa_return_output,
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output);

     -- uint12_uint4_4[uxn_c_l290_c15_4c92] LATENCY=0
     VAR_uint12_uint4_4_uxn_c_l290_c15_4c92_return_output := uint12_uint4_4(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l298_l290_l282_DUPLICATE_51aa_return_output,
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output);

     -- BIN_OP_EQ[uxn_c_l293_c12_1e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l293_c12_1e4a_left <= VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_left;
     BIN_OP_EQ_uxn_c_l293_c12_1e4a_right <= VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output := BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output;

     -- BIN_OP_EQ[uxn_c_l285_c12_2394] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l285_c12_2394_left <= VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_left;
     BIN_OP_EQ_uxn_c_l285_c12_2394_right <= VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_return_output := BIN_OP_EQ_uxn_c_l285_c12_2394_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c12_b025] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c12_b025_left <= VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_left;
     BIN_OP_EQ_uxn_c_l289_c12_b025_right <= VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_return_output := BIN_OP_EQ_uxn_c_l289_c12_b025_return_output;

     -- uint12_uint4_8[uxn_c_l287_c15_5216] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l287_c15_5216_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c_return_output,
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output);

     -- uint12_uint4_8[uxn_c_l286_c15_a14c] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l286_c15_a14c_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l286_l301_l302_l294_DUPLICATE_c10f_return_output,
     VAR_uint8_7_4_uxn_c_l276_c16_d2a7_return_output);

     -- uint12_uint4_0[uxn_c_l299_c15_2cb4] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l299_c15_2cb4_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l291_l299_l283_DUPLICATE_cae7_return_output,
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output);

     -- uint12_uint4_0[uxn_c_l303_c15_78e4] LATENCY=0
     VAR_uint12_uint4_0_uxn_c_l303_c15_78e4_return_output := uint12_uint4_0(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l287_l301_l295_l303_DUPLICATE_477c_return_output,
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output);

     -- uint12_uint4_8[uxn_c_l283_c15_89cf] LATENCY=0
     VAR_uint12_uint4_8_uxn_c_l283_c15_89cf_return_output := uint12_uint4_8(
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l291_l299_l283_DUPLICATE_cae7_return_output,
     VAR_uint8_3_0_uxn_c_l277_c16_8e7d_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_c_l278_c21_040d_cond := VAR_BIN_OP_EQ_uxn_c_l278_c21_b234_return_output;
     VAR_color_MUX_uxn_c_l281_c3_7fc4_cond := VAR_BIN_OP_EQ_uxn_c_l281_c7_04db_return_output;
     VAR_color_MUX_uxn_c_l285_c8_cb92_cond := VAR_BIN_OP_EQ_uxn_c_l285_c12_2394_return_output;
     VAR_color_MUX_uxn_c_l289_c8_6b77_cond := VAR_BIN_OP_EQ_uxn_c_l289_c12_b025_return_output;
     VAR_color_MUX_uxn_c_l293_c8_2d7f_cond := VAR_BIN_OP_EQ_uxn_c_l293_c12_1e4a_return_output;
     VAR_color_MUX_uxn_c_l297_c8_b340_cond := VAR_BIN_OP_EQ_uxn_c_l297_c12_4017_return_output;
     VAR_color_2_MUX_uxn_c_l301_c8_835f_cond := VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_return_output;
     VAR_color_3_MUX_uxn_c_l301_c8_835f_cond := VAR_BIN_OP_EQ_uxn_c_l301_c12_43df_return_output;
     VAR_color_2_MUX_uxn_c_l301_c8_835f_iftrue := VAR_uint12_uint4_0_uxn_c_l302_c15_b7e0_return_output;
     VAR_color_3_MUX_uxn_c_l301_c8_835f_iftrue := VAR_uint12_uint4_0_uxn_c_l303_c15_78e4_return_output;
     -- color_2_MUX[uxn_c_l301_c8_835f] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l301_c8_835f_cond <= VAR_color_2_MUX_uxn_c_l301_c8_835f_cond;
     color_2_MUX_uxn_c_l301_c8_835f_iftrue <= VAR_color_2_MUX_uxn_c_l301_c8_835f_iftrue;
     color_2_MUX_uxn_c_l301_c8_835f_iffalse <= VAR_color_2_MUX_uxn_c_l301_c8_835f_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l301_c8_835f_return_output := color_2_MUX_uxn_c_l301_c8_835f_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l293_c8_2d7f] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l293_c8_2d7f_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_uint12_uint4_4_uxn_c_l294_c15_b050_return_output,
     VAR_uint12_uint4_4_uxn_c_l295_c15_9025_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l297_c8_b340] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l297_c8_b340_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_0_uxn_c_l298_c15_3215_return_output,
     VAR_uint12_uint4_0_uxn_c_l299_c15_2cb4_return_output);

     -- MUX[uxn_c_l278_c21_040d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l278_c21_040d_cond <= VAR_MUX_uxn_c_l278_c21_040d_cond;
     MUX_uxn_c_l278_c21_040d_iftrue <= VAR_MUX_uxn_c_l278_c21_040d_iftrue;
     MUX_uxn_c_l278_c21_040d_iffalse <= VAR_MUX_uxn_c_l278_c21_040d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l278_c21_040d_return_output := MUX_uxn_c_l278_c21_040d_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l285_c8_cb92] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l285_c8_cb92_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_uint12_uint4_8_uxn_c_l286_c15_a14c_return_output,
     VAR_uint12_uint4_8_uxn_c_l287_c15_5216_return_output);

     -- color_3_MUX[uxn_c_l301_c8_835f] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l301_c8_835f_cond <= VAR_color_3_MUX_uxn_c_l301_c8_835f_cond;
     color_3_MUX_uxn_c_l301_c8_835f_iftrue <= VAR_color_3_MUX_uxn_c_l301_c8_835f_iftrue;
     color_3_MUX_uxn_c_l301_c8_835f_iffalse <= VAR_color_3_MUX_uxn_c_l301_c8_835f_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l301_c8_835f_return_output := color_3_MUX_uxn_c_l301_c8_835f_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l281_c3_7fc4] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l281_c3_7fc4_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_8_uxn_c_l282_c15_0719_return_output,
     VAR_uint12_uint4_8_uxn_c_l283_c15_89cf_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l289_c8_6b77] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l289_c8_6b77_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_uint12_uint4_4_uxn_c_l290_c15_4c92_return_output,
     VAR_uint12_uint4_4_uxn_c_l291_c15_e7d4_return_output);

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_right := VAR_MUX_uxn_c_l278_c21_040d_return_output;
     REG_VAR_is_palette_range := VAR_MUX_uxn_c_l278_c21_040d_return_output;
     VAR_color_MUX_uxn_c_l281_c3_7fc4_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l281_c3_7fc4_return_output;
     VAR_color_MUX_uxn_c_l289_c8_6b77_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l289_c8_6b77_return_output;
     VAR_color_MUX_uxn_c_l297_c8_b340_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l297_c8_b340_return_output;
     VAR_color_MUX_uxn_c_l285_c8_cb92_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l285_c8_cb92_return_output;
     VAR_color_MUX_uxn_c_l293_c8_2d7f_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l293_c8_2d7f_return_output;
     -- BIN_OP_AND[uxn_c_l280_c6_edc3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l280_c6_edc3_left <= VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_left;
     BIN_OP_AND_uxn_c_l280_c6_edc3_right <= VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_return_output := BIN_OP_AND_uxn_c_l280_c6_edc3_return_output;

     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l297_c8_b340] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l297_c8_b340_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l301_c8_835f_return_output,
     VAR_color_3_MUX_uxn_c_l301_c8_835f_return_output);

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l280_c2_8126_cond := VAR_BIN_OP_AND_uxn_c_l280_c6_edc3_return_output;
     VAR_color_MUX_uxn_c_l297_c8_b340_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l297_c8_b340_return_output;
     -- color_MUX[uxn_c_l297_c8_b340] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l297_c8_b340_cond <= VAR_color_MUX_uxn_c_l297_c8_b340_cond;
     color_MUX_uxn_c_l297_c8_b340_iftrue <= VAR_color_MUX_uxn_c_l297_c8_b340_iftrue;
     color_MUX_uxn_c_l297_c8_b340_iffalse <= VAR_color_MUX_uxn_c_l297_c8_b340_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l297_c8_b340_return_output := color_MUX_uxn_c_l297_c8_b340_return_output;

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l293_c8_2d7f_iffalse := VAR_color_MUX_uxn_c_l297_c8_b340_return_output;
     -- color_MUX[uxn_c_l293_c8_2d7f] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l293_c8_2d7f_cond <= VAR_color_MUX_uxn_c_l293_c8_2d7f_cond;
     color_MUX_uxn_c_l293_c8_2d7f_iftrue <= VAR_color_MUX_uxn_c_l293_c8_2d7f_iftrue;
     color_MUX_uxn_c_l293_c8_2d7f_iffalse <= VAR_color_MUX_uxn_c_l293_c8_2d7f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l293_c8_2d7f_return_output := color_MUX_uxn_c_l293_c8_2d7f_return_output;

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l289_c8_6b77_iffalse := VAR_color_MUX_uxn_c_l293_c8_2d7f_return_output;
     -- color_MUX[uxn_c_l289_c8_6b77] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l289_c8_6b77_cond <= VAR_color_MUX_uxn_c_l289_c8_6b77_cond;
     color_MUX_uxn_c_l289_c8_6b77_iftrue <= VAR_color_MUX_uxn_c_l289_c8_6b77_iftrue;
     color_MUX_uxn_c_l289_c8_6b77_iffalse <= VAR_color_MUX_uxn_c_l289_c8_6b77_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l289_c8_6b77_return_output := color_MUX_uxn_c_l289_c8_6b77_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l285_c8_cb92_iffalse := VAR_color_MUX_uxn_c_l289_c8_6b77_return_output;
     -- color_MUX[uxn_c_l285_c8_cb92] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l285_c8_cb92_cond <= VAR_color_MUX_uxn_c_l285_c8_cb92_cond;
     color_MUX_uxn_c_l285_c8_cb92_iftrue <= VAR_color_MUX_uxn_c_l285_c8_cb92_iftrue;
     color_MUX_uxn_c_l285_c8_cb92_iffalse <= VAR_color_MUX_uxn_c_l285_c8_cb92_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l285_c8_cb92_return_output := color_MUX_uxn_c_l285_c8_cb92_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l281_c3_7fc4_iffalse := VAR_color_MUX_uxn_c_l285_c8_cb92_return_output;
     -- color_MUX[uxn_c_l281_c3_7fc4] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l281_c3_7fc4_cond <= VAR_color_MUX_uxn_c_l281_c3_7fc4_cond;
     color_MUX_uxn_c_l281_c3_7fc4_iftrue <= VAR_color_MUX_uxn_c_l281_c3_7fc4_iftrue;
     color_MUX_uxn_c_l281_c3_7fc4_iffalse <= VAR_color_MUX_uxn_c_l281_c3_7fc4_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l281_c3_7fc4_return_output := color_MUX_uxn_c_l281_c3_7fc4_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l280_c2_8126_iftrue := VAR_color_MUX_uxn_c_l281_c3_7fc4_return_output;
     -- color_MUX[uxn_c_l280_c2_8126] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l280_c2_8126_cond <= VAR_color_MUX_uxn_c_l280_c2_8126_cond;
     color_MUX_uxn_c_l280_c2_8126_iftrue <= VAR_color_MUX_uxn_c_l280_c2_8126_iftrue;
     color_MUX_uxn_c_l280_c2_8126_iffalse <= VAR_color_MUX_uxn_c_l280_c2_8126_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l280_c2_8126_return_output := color_MUX_uxn_c_l280_c2_8126_return_output;

     -- Submodule level 10
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_ref_toks_0 := VAR_color_MUX_uxn_c_l280_c2_8126_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l280_c2_8126_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l307_c9_8217] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output;

     -- Submodule level 11
     VAR_return_output := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l307_c9_8217_return_output, 16);
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
