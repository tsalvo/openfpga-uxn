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
-- Submodules: 66
entity screen_1bpp_0CLK_72b59ec3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 x1 : in unsigned(15 downto 0);
 y1 : in unsigned(15 downto 0);
 color : in unsigned(3 downto 0);
 fx : in unsigned(0 downto 0);
 fy : in unsigned(0 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_1bpp_0CLK_72b59ec3;
architecture arch of screen_1bpp_0CLK_72b59ec3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal blending : uint2_t_48 := (
0 => to_unsigned(0, 2),
1 => to_unsigned(0, 2),
2 => to_unsigned(0, 2),
3 => to_unsigned(0, 2),
4 => to_unsigned(1, 2),
5 => to_unsigned(0, 2),
6 => to_unsigned(1, 2),
7 => to_unsigned(1, 2),
8 => to_unsigned(2, 2),
9 => to_unsigned(2, 2),
10 => to_unsigned(0, 2),
11 => to_unsigned(2, 2),
12 => to_unsigned(3, 2),
13 => to_unsigned(3, 2),
14 => to_unsigned(3, 2),
15 => to_unsigned(0, 2),
16 => to_unsigned(0, 2),
17 => to_unsigned(1, 2),
18 => to_unsigned(2, 2),
19 => to_unsigned(3, 2),
20 => to_unsigned(0, 2),
21 => to_unsigned(1, 2),
22 => to_unsigned(2, 2),
23 => to_unsigned(3, 2),
24 => to_unsigned(0, 2),
25 => to_unsigned(1, 2),
26 => to_unsigned(2, 2),
27 => to_unsigned(3, 2),
28 => to_unsigned(0, 2),
29 => to_unsigned(1, 2),
30 => to_unsigned(2, 2),
31 => to_unsigned(3, 2),
32 => to_unsigned(0, 2),
33 => to_unsigned(1, 2),
34 => to_unsigned(1, 2),
35 => to_unsigned(1, 2),
36 => to_unsigned(1, 2),
37 => to_unsigned(0, 2),
38 => to_unsigned(1, 2),
39 => to_unsigned(1, 2),
40 => to_unsigned(1, 2),
41 => to_unsigned(1, 2),
42 => to_unsigned(0, 2),
43 => to_unsigned(1, 2),
44 => to_unsigned(1, 2),
45 => to_unsigned(1, 2),
46 => to_unsigned(1, 2),
47 => to_unsigned(0, 2),
others => to_unsigned(0, 2))
;
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(11 downto 0) := to_unsigned(0, 12);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_8 := (others => to_unsigned(0, 8));
signal is_x_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_y_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_blending : uint2_t_48;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(11 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_8;
signal REG_COMB_is_x_in_bounds : unsigned(0 downto 0);
signal REG_COMB_is_y_in_bounds : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l132_c20_13fb]
signal BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c6_703f]
signal BIN_OP_EQ_uxn_device_h_l134_c6_703f_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c6_703f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l134_c2_789d]
signal sprite_rows_MUX_uxn_device_h_l134_c2_789d_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l134_c2_789d_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l134_c2_789d_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l135_c3_cae2]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output : uint8_t_array_8_t;

-- BIN_OP_EQ[uxn_device_h_l138_c6_11fa]
signal BIN_OP_EQ_uxn_device_h_l138_c6_11fa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c6_11fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l138_c2_88e3]
signal y_MUX_uxn_device_h_l138_c2_88e3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c2_88e3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c2_88e3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c2_88e3_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l138_c2_88e3]
signal x_MUX_uxn_device_h_l138_c2_88e3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c2_88e3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c2_88e3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c2_88e3_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l138_c2_88e3]
signal opaque_MUX_uxn_device_h_l138_c2_88e3_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l138_c2_88e3_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l138_c2_88e3_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l138_c2_88e3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l139_c21_0b07]
signal BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l139_c12_bc2e]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l140_c13_0b61]
signal MUX_uxn_device_h_l140_c13_0b61_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l140_c13_0b61_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l140_c13_0b61_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l140_c13_0b61_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l140_c7_fb64]
signal BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l141_c13_819c]
signal MUX_uxn_device_h_l141_c13_819c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l141_c13_819c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l141_c13_819c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l141_c13_819c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l141_c7_a84e]
signal BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l144_c6_a358]
signal BIN_OP_EQ_uxn_device_h_l144_c6_a358_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c6_a358_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l144_c2_4df3]
signal y_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l144_c2_4df3]
signal x_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(15 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l144_c2_4df3]
signal is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l144_c2_4df3]
signal is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l144_c2_4df3]
signal c_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l144_c2_4df3]
signal result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c2_4df3]
signal result_u8_value_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l144_c2_4df3]
signal result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l144_c2_4df3]
signal result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l148_c21_bcf2]
signal BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c7_c3df]
signal BIN_OP_EQ_uxn_device_h_l150_c7_c3df_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c7_c3df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l150_c46_2b2e]
signal BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l150_c34_92e3]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l150_c7_4379]
signal MUX_uxn_device_h_l150_c7_4379_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c7_4379_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l150_c7_4379_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l150_c7_4379_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c7_2ba2]
signal BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l151_c41_4f71]
signal MUX_uxn_device_h_l151_c41_4f71_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c41_4f71_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c41_4f71_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c41_4f71_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l151_c35_f820]
signal BIN_OP_PLUS_uxn_device_h_l151_c35_f820_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l151_c35_f820_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l151_c7_2059]
signal MUX_uxn_device_h_l151_c7_2059_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c7_2059_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c7_2059_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c7_2059_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c20_12c3]
signal BIN_OP_EQ_uxn_device_h_l152_c20_12c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c20_12c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l152_c20_3491]
signal MUX_uxn_device_h_l152_c20_3491_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l152_c20_3491_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l152_c20_3491_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l152_c20_3491_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l153_c20_492c]
signal BIN_OP_EQ_uxn_device_h_l153_c20_492c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c20_492c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c20_67c6]
signal MUX_uxn_device_h_l153_c20_67c6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c20_67c6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c20_67c6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c20_67c6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l156_c26_c1c5]
signal BIN_OP_AND_uxn_device_h_l156_c26_c1c5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l156_c26_c1c5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l156_c61_73d9]
signal BIN_OP_OR_uxn_device_h_l156_c61_73d9_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l156_c61_73d9_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l156_c26_6a8e]
signal BIN_OP_AND_uxn_device_h_l156_c26_6a8e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l156_c26_6a8e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l157_c40_eb92]
signal MUX_uxn_device_h_l157_c40_eb92_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l157_c40_eb92_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l157_c40_eb92_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l157_c40_eb92_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c30_7c1d]
signal BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l157_c21_bf03]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l158_c7_0436]
signal BIN_OP_EQ_uxn_device_h_l158_c7_0436_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l158_c7_0436_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l158_c41_f939]
signal BIN_OP_MINUS_uxn_device_h_l158_c41_f939_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c41_f939_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l158_c51_f399]
signal BIN_OP_PLUS_uxn_device_h_l158_c51_f399_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c51_f399_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l158_c35_35b6]
signal MUX_uxn_device_h_l158_c35_35b6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l158_c35_35b6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c35_35b6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c35_35b6_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l158_c7_b138]
signal MUX_uxn_device_h_l158_c7_b138_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l158_c7_b138_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c7_b138_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c7_b138_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l159_c25_a9b7]
signal BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l159_c25_a8b3]
signal MUX_uxn_device_h_l159_c25_a8b3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c25_a8b3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c25_a8b3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c25_a8b3_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l160_c3_d483]
signal CONST_SR_1_uxn_device_h_l160_c3_d483_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l160_c3_d483_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l161_c14_0ccc]
signal BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l161_c24_56b2]
signal BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l161_c8_2d69]
signal MUX_uxn_device_h_l161_c8_2d69_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l161_c8_2d69_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l161_c8_2d69_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l161_c8_2d69_return_output : unsigned(15 downto 0);

function uint12_7_3( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function uint12_2_0( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(2 downto 0);
begin
return_output := unsigned(std_logic_vector(x(2 downto 0)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5( ref_toks_0 : uint8_t_array_8_t) return uint8_t_8 is
 
  variable base : uint8_t_8; 
  variable return_output : uint8_t_8;
begin
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);
      base(4) := ref_toks_0.data(4);
      base(0) := ref_toks_0.data(0);
      base(3) := ref_toks_0.data(3);
      base(6) := ref_toks_0.data(6);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);

      return_output := base;
      return return_output; 
end function;

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function uint16_7_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
return return_output;
end function;

function uint16_uint8_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(15 downto 8) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_uint8_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l132_c20_13fb
BIN_OP_MINUS_uxn_device_h_l132_c20_13fb : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_left,
BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_right,
BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c6_703f
BIN_OP_EQ_uxn_device_h_l134_c6_703f : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c6_703f_left,
BIN_OP_EQ_uxn_device_h_l134_c6_703f_right,
BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output);

-- sprite_rows_MUX_uxn_device_h_l134_c2_789d
sprite_rows_MUX_uxn_device_h_l134_c2_789d : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l134_c2_789d_cond,
sprite_rows_MUX_uxn_device_h_l134_c2_789d_iftrue,
sprite_rows_MUX_uxn_device_h_l134_c2_789d_iffalse,
sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c6_11fa
BIN_OP_EQ_uxn_device_h_l138_c6_11fa : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c6_11fa_left,
BIN_OP_EQ_uxn_device_h_l138_c6_11fa_right,
BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output);

-- y_MUX_uxn_device_h_l138_c2_88e3
y_MUX_uxn_device_h_l138_c2_88e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c2_88e3_cond,
y_MUX_uxn_device_h_l138_c2_88e3_iftrue,
y_MUX_uxn_device_h_l138_c2_88e3_iffalse,
y_MUX_uxn_device_h_l138_c2_88e3_return_output);

-- x_MUX_uxn_device_h_l138_c2_88e3
x_MUX_uxn_device_h_l138_c2_88e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c2_88e3_cond,
x_MUX_uxn_device_h_l138_c2_88e3_iftrue,
x_MUX_uxn_device_h_l138_c2_88e3_iffalse,
x_MUX_uxn_device_h_l138_c2_88e3_return_output);

-- opaque_MUX_uxn_device_h_l138_c2_88e3
opaque_MUX_uxn_device_h_l138_c2_88e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l138_c2_88e3_cond,
opaque_MUX_uxn_device_h_l138_c2_88e3_iftrue,
opaque_MUX_uxn_device_h_l138_c2_88e3_iffalse,
opaque_MUX_uxn_device_h_l138_c2_88e3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l139_c21_0b07
BIN_OP_PLUS_uxn_device_h_l139_c21_0b07 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_left,
BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_right,
BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output);

-- MUX_uxn_device_h_l140_c13_0b61
MUX_uxn_device_h_l140_c13_0b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l140_c13_0b61_cond,
MUX_uxn_device_h_l140_c13_0b61_iftrue,
MUX_uxn_device_h_l140_c13_0b61_iffalse,
MUX_uxn_device_h_l140_c13_0b61_return_output);

-- BIN_OP_PLUS_uxn_device_h_l140_c7_fb64
BIN_OP_PLUS_uxn_device_h_l140_c7_fb64 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_left,
BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_right,
BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output);

-- MUX_uxn_device_h_l141_c13_819c
MUX_uxn_device_h_l141_c13_819c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l141_c13_819c_cond,
MUX_uxn_device_h_l141_c13_819c_iftrue,
MUX_uxn_device_h_l141_c13_819c_iffalse,
MUX_uxn_device_h_l141_c13_819c_return_output);

-- BIN_OP_PLUS_uxn_device_h_l141_c7_a84e
BIN_OP_PLUS_uxn_device_h_l141_c7_a84e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_left,
BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_right,
BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output);

-- BIN_OP_EQ_uxn_device_h_l144_c6_a358
BIN_OP_EQ_uxn_device_h_l144_c6_a358 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l144_c6_a358_left,
BIN_OP_EQ_uxn_device_h_l144_c6_a358_right,
BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output);

-- y_MUX_uxn_device_h_l144_c2_4df3
y_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c2_4df3_cond,
y_MUX_uxn_device_h_l144_c2_4df3_iftrue,
y_MUX_uxn_device_h_l144_c2_4df3_iffalse,
y_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- x_MUX_uxn_device_h_l144_c2_4df3
x_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c2_4df3_cond,
x_MUX_uxn_device_h_l144_c2_4df3_iftrue,
x_MUX_uxn_device_h_l144_c2_4df3_iffalse,
x_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3
is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond,
is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3
is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond,
is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- c_MUX_uxn_device_h_l144_c2_4df3
c_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l144_c2_4df3_cond,
c_MUX_uxn_device_h_l144_c2_4df3_iftrue,
c_MUX_uxn_device_h_l144_c2_4df3_iffalse,
c_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3
result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_cond,
result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iftrue,
result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iffalse,
result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c2_4df3
result_u8_value_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c2_4df3_cond,
result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- result_u16_addr_MUX_uxn_device_h_l144_c2_4df3
result_u16_addr_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_cond,
result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iftrue,
result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iffalse,
result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3
result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_cond,
result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iftrue,
result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iffalse,
result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2
BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2 : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_left,
BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_right,
BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c7_c3df
BIN_OP_EQ_uxn_device_h_l150_c7_c3df : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c7_c3df_left,
BIN_OP_EQ_uxn_device_h_l150_c7_c3df_right,
BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output);

-- BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e
BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_left,
BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_right,
BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3 : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output);

-- MUX_uxn_device_h_l150_c7_4379
MUX_uxn_device_h_l150_c7_4379 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l150_c7_4379_cond,
MUX_uxn_device_h_l150_c7_4379_iftrue,
MUX_uxn_device_h_l150_c7_4379_iffalse,
MUX_uxn_device_h_l150_c7_4379_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c7_2ba2
BIN_OP_EQ_uxn_device_h_l151_c7_2ba2 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_left,
BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_right,
BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output);

-- MUX_uxn_device_h_l151_c41_4f71
MUX_uxn_device_h_l151_c41_4f71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l151_c41_4f71_cond,
MUX_uxn_device_h_l151_c41_4f71_iftrue,
MUX_uxn_device_h_l151_c41_4f71_iffalse,
MUX_uxn_device_h_l151_c41_4f71_return_output);

-- BIN_OP_PLUS_uxn_device_h_l151_c35_f820
BIN_OP_PLUS_uxn_device_h_l151_c35_f820 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l151_c35_f820_left,
BIN_OP_PLUS_uxn_device_h_l151_c35_f820_right,
BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output);

-- MUX_uxn_device_h_l151_c7_2059
MUX_uxn_device_h_l151_c7_2059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l151_c7_2059_cond,
MUX_uxn_device_h_l151_c7_2059_iftrue,
MUX_uxn_device_h_l151_c7_2059_iffalse,
MUX_uxn_device_h_l151_c7_2059_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c20_12c3
BIN_OP_EQ_uxn_device_h_l152_c20_12c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c20_12c3_left,
BIN_OP_EQ_uxn_device_h_l152_c20_12c3_right,
BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output);

-- MUX_uxn_device_h_l152_c20_3491
MUX_uxn_device_h_l152_c20_3491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l152_c20_3491_cond,
MUX_uxn_device_h_l152_c20_3491_iftrue,
MUX_uxn_device_h_l152_c20_3491_iffalse,
MUX_uxn_device_h_l152_c20_3491_return_output);

-- BIN_OP_EQ_uxn_device_h_l153_c20_492c
BIN_OP_EQ_uxn_device_h_l153_c20_492c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l153_c20_492c_left,
BIN_OP_EQ_uxn_device_h_l153_c20_492c_right,
BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output);

-- MUX_uxn_device_h_l153_c20_67c6
MUX_uxn_device_h_l153_c20_67c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c20_67c6_cond,
MUX_uxn_device_h_l153_c20_67c6_iftrue,
MUX_uxn_device_h_l153_c20_67c6_iffalse,
MUX_uxn_device_h_l153_c20_67c6_return_output);

-- BIN_OP_AND_uxn_device_h_l156_c26_c1c5
BIN_OP_AND_uxn_device_h_l156_c26_c1c5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l156_c26_c1c5_left,
BIN_OP_AND_uxn_device_h_l156_c26_c1c5_right,
BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output);

-- BIN_OP_OR_uxn_device_h_l156_c61_73d9
BIN_OP_OR_uxn_device_h_l156_c61_73d9 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l156_c61_73d9_left,
BIN_OP_OR_uxn_device_h_l156_c61_73d9_right,
BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output);

-- BIN_OP_AND_uxn_device_h_l156_c26_6a8e
BIN_OP_AND_uxn_device_h_l156_c26_6a8e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l156_c26_6a8e_left,
BIN_OP_AND_uxn_device_h_l156_c26_6a8e_right,
BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output);

-- MUX_uxn_device_h_l157_c40_eb92
MUX_uxn_device_h_l157_c40_eb92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l157_c40_eb92_cond,
MUX_uxn_device_h_l157_c40_eb92_iftrue,
MUX_uxn_device_h_l157_c40_eb92_iffalse,
MUX_uxn_device_h_l157_c40_eb92_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d
BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_left,
BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_right,
BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output);

-- BIN_OP_EQ_uxn_device_h_l158_c7_0436
BIN_OP_EQ_uxn_device_h_l158_c7_0436 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l158_c7_0436_left,
BIN_OP_EQ_uxn_device_h_l158_c7_0436_right,
BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output);

-- BIN_OP_MINUS_uxn_device_h_l158_c41_f939
BIN_OP_MINUS_uxn_device_h_l158_c41_f939 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l158_c41_f939_left,
BIN_OP_MINUS_uxn_device_h_l158_c41_f939_right,
BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output);

-- BIN_OP_PLUS_uxn_device_h_l158_c51_f399
BIN_OP_PLUS_uxn_device_h_l158_c51_f399 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l158_c51_f399_left,
BIN_OP_PLUS_uxn_device_h_l158_c51_f399_right,
BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output);

-- MUX_uxn_device_h_l158_c35_35b6
MUX_uxn_device_h_l158_c35_35b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l158_c35_35b6_cond,
MUX_uxn_device_h_l158_c35_35b6_iftrue,
MUX_uxn_device_h_l158_c35_35b6_iffalse,
MUX_uxn_device_h_l158_c35_35b6_return_output);

-- MUX_uxn_device_h_l158_c7_b138
MUX_uxn_device_h_l158_c7_b138 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l158_c7_b138_cond,
MUX_uxn_device_h_l158_c7_b138_iftrue,
MUX_uxn_device_h_l158_c7_b138_iffalse,
MUX_uxn_device_h_l158_c7_b138_return_output);

-- BIN_OP_EQ_uxn_device_h_l159_c25_a9b7
BIN_OP_EQ_uxn_device_h_l159_c25_a9b7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_left,
BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_right,
BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output);

-- MUX_uxn_device_h_l159_c25_a8b3
MUX_uxn_device_h_l159_c25_a8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l159_c25_a8b3_cond,
MUX_uxn_device_h_l159_c25_a8b3_iftrue,
MUX_uxn_device_h_l159_c25_a8b3_iffalse,
MUX_uxn_device_h_l159_c25_a8b3_return_output);

-- CONST_SR_1_uxn_device_h_l160_c3_d483
CONST_SR_1_uxn_device_h_l160_c3_d483 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l160_c3_d483_x,
CONST_SR_1_uxn_device_h_l160_c3_d483_return_output);

-- BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc
BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_left,
BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_right,
BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output);

-- BIN_OP_MINUS_uxn_device_h_l161_c24_56b2
BIN_OP_MINUS_uxn_device_h_l161_c24_56b2 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_left,
BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_right,
BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output);

-- MUX_uxn_device_h_l161_c8_2d69
MUX_uxn_device_h_l161_c8_2d69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l161_c8_2d69_cond,
MUX_uxn_device_h_l161_c8_2d69_iftrue,
MUX_uxn_device_h_l161_c8_2d69_iffalse,
MUX_uxn_device_h_l161_c8_2d69_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 x1,
 y1,
 color,
 fx,
 fy,
 ram_addr,
 previous_ram_read,
 -- Registers
 blending,
 x,
 y,
 opaque,
 c,
 color8,
 result,
 phase_minus_two,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 is_x_in_bounds,
 is_y_in_bounds,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output,
 sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output,
 y_MUX_uxn_device_h_l138_c2_88e3_return_output,
 x_MUX_uxn_device_h_l138_c2_88e3_return_output,
 opaque_MUX_uxn_device_h_l138_c2_88e3_return_output,
 BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output,
 MUX_uxn_device_h_l140_c13_0b61_return_output,
 BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output,
 MUX_uxn_device_h_l141_c13_819c_return_output,
 BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output,
 BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output,
 y_MUX_uxn_device_h_l144_c2_4df3_return_output,
 x_MUX_uxn_device_h_l144_c2_4df3_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output,
 c_MUX_uxn_device_h_l144_c2_4df3_return_output,
 result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output,
 result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output,
 result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output,
 BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output,
 BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output,
 MUX_uxn_device_h_l150_c7_4379_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output,
 MUX_uxn_device_h_l151_c41_4f71_return_output,
 BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output,
 MUX_uxn_device_h_l151_c7_2059_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output,
 MUX_uxn_device_h_l152_c20_3491_return_output,
 BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output,
 MUX_uxn_device_h_l153_c20_67c6_return_output,
 BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output,
 BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output,
 BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output,
 MUX_uxn_device_h_l157_c40_eb92_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output,
 BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output,
 BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output,
 BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output,
 MUX_uxn_device_h_l158_c35_35b6_return_output,
 MUX_uxn_device_h_l158_c7_b138_return_output,
 BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output,
 MUX_uxn_device_h_l159_c25_a8b3_return_output,
 CONST_SR_1_uxn_device_h_l160_c3_d483_return_output,
 BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output,
 BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output,
 MUX_uxn_device_h_l161_c8_2d69_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_x1 : unsigned(15 downto 0);
 variable VAR_y1 : unsigned(15 downto 0);
 variable VAR_color : unsigned(3 downto 0);
 variable VAR_fx : unsigned(0 downto 0);
 variable VAR_fy : unsigned(0 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_color8_uxn_device_h_l129_c2_5c67 : unsigned(7 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l130_c20_9861_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l131_c20_d4df_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l132_c2_c53b : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_left : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l134_c6_db4c_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l134_c2_789d_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_var_dim_0 : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c2_88e3_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l141_c3_db29 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c2_88e3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c2_88e3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c2_88e3_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l140_c3_d4c2 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c2_88e3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c2_88e3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c2_88e3_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l139_c3_80c7 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_ref_toks_0 : uint2_t_48;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_0b61_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_0b61_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_0b61_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_0b61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c13_819c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c13_819c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c13_819c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c13_819c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l146_c3_c942 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l157_c3_587a : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l148_c3_ddcb : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_4379_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_4379_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_4379_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_ref_toks_0 : uint8_t_8;
 variable VAR_MUX_uxn_device_h_l150_c7_4379_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c7_2059_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c7_2059_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c7_2059_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c41_4f71_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c41_4f71_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c41_4f71_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c41_4f71_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c7_2059_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l152_c20_3491_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l152_c20_0348_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l152_c20_3491_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l152_c20_3491_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l152_c20_3491_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c20_67c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l153_c20_c0ca_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c20_67c6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c20_67c6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c20_67c6_return_output : unsigned(0 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l154_c39_0c95_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l154_c21_a4f9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l155_c53_c918_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l155_c21_68a8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l157_c40_eb92_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l157_c40_eb92_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l157_c40_eb92_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l157_c40_eb92_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l158_c7_b138_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c7_b138_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c7_b138_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c35_35b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c35_35b6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c35_35b6_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c35_35b6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c7_b138_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c25_a8b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c25_a8b3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c25_a8b3_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c25_a8b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l160_c3_d483_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l160_c3_d483_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l161_c8_2d69_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l161_c8_2d69_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l161_c8_2d69_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l161_c8_2d69_return_output : unsigned(15 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l156_l157_DUPLICATE_80b8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l110_l164_DUPLICATE_9eed_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint2_t_48;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(11 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_8;
variable REG_VAR_is_x_in_bounds : unsigned(0 downto 0);
variable REG_VAR_is_y_in_bounds : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
  REG_VAR_is_x_in_bounds := is_x_in_bounds;
  REG_VAR_is_y_in_bounds := is_y_in_bounds;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_device_h_l140_c13_0b61_iftrue := to_unsigned(0, 16);
     VAR_result_u8_value_uxn_device_h_l146_c3_c942 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iftrue := VAR_result_u8_value_uxn_device_h_l146_c3_c942;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l141_c13_819c_iffalse := to_unsigned(0, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_left := to_unsigned(32, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l153_c20_67c6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l140_c13_0b61_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l152_c20_3491_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l159_c25_a8b3_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l141_c13_819c_iftrue := to_unsigned(7, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l159_c25_a8b3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l157_c40_eb92_iftrue := to_unsigned(16, 8);
     VAR_MUX_uxn_device_h_l153_c20_67c6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l151_c41_4f71_iftrue := to_unsigned(0, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l151_c41_4f71_iffalse := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l152_c20_3491_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_right := to_unsigned(71, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l157_c40_eb92_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_right := to_unsigned(0, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_x1 := x1;
     VAR_y1 := y1;
     VAR_color := color;
     VAR_fx := fx;
     VAR_fy := fy;
     VAR_ram_addr := ram_addr;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l150_c7_4379_iffalse := c;
     VAR_c_MUX_uxn_device_h_l144_c2_4df3_iftrue := c;
     VAR_color8_uxn_device_h_l129_c2_5c67 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l140_c13_0b61_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l151_c41_4f71_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l161_c8_2d69_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l141_c13_819c_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l158_c35_35b6_cond := VAR_fy;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue := is_x_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue := is_y_in_bounds;
     VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l138_c2_88e3_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l138_c2_88e3_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_right := VAR_color8_uxn_device_h_l129_c2_5c67;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_left := VAR_color8_uxn_device_h_l129_c2_5c67;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l129_c2_5c67;
     -- BIN_OP_EQ[uxn_device_h_l159_c25_a9b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_left <= VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_left;
     BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_right <= VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output := BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l139_c21_0b07] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_left <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_left;
     BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_right <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output := BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c6_11fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c6_11fa_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_left;
     BIN_OP_EQ_uxn_device_h_l138_c6_11fa_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output := BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l148_c21_bcf2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_left;
     BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output := BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output;

     -- MUX[uxn_device_h_l140_c13_0b61] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l140_c13_0b61_cond <= VAR_MUX_uxn_device_h_l140_c13_0b61_cond;
     MUX_uxn_device_h_l140_c13_0b61_iftrue <= VAR_MUX_uxn_device_h_l140_c13_0b61_iftrue;
     MUX_uxn_device_h_l140_c13_0b61_iffalse <= VAR_MUX_uxn_device_h_l140_c13_0b61_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l140_c13_0b61_return_output := MUX_uxn_device_h_l140_c13_0b61_return_output;

     -- MUX[uxn_device_h_l151_c41_4f71] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l151_c41_4f71_cond <= VAR_MUX_uxn_device_h_l151_c41_4f71_cond;
     MUX_uxn_device_h_l151_c41_4f71_iftrue <= VAR_MUX_uxn_device_h_l151_c41_4f71_iftrue;
     MUX_uxn_device_h_l151_c41_4f71_iffalse <= VAR_MUX_uxn_device_h_l151_c41_4f71_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l151_c41_4f71_return_output := MUX_uxn_device_h_l151_c41_4f71_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l132_c20_13fb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_left <= VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_left;
     BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_right <= VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output := BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output;

     -- uint12_7_3[uxn_device_h_l130_c20_9861] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l130_c20_9861_return_output := uint12_7_3(
     VAR_phase);

     -- uint12_2_0[uxn_device_h_l131_c20_d4df] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l131_c20_d4df_return_output := uint12_2_0(
     VAR_phase);

     -- MUX[uxn_device_h_l141_c13_819c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l141_c13_819c_cond <= VAR_MUX_uxn_device_h_l141_c13_819c_cond;
     MUX_uxn_device_h_l141_c13_819c_iftrue <= VAR_MUX_uxn_device_h_l141_c13_819c_iftrue;
     MUX_uxn_device_h_l141_c13_819c_iffalse <= VAR_MUX_uxn_device_h_l141_c13_819c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l141_c13_819c_return_output := MUX_uxn_device_h_l141_c13_819c_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output;
     VAR_x_MUX_uxn_device_h_l138_c2_88e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output;
     VAR_y_MUX_uxn_device_h_l138_c2_88e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c6_11fa_return_output;
     VAR_MUX_uxn_device_h_l159_c25_a8b3_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c25_a9b7_return_output;
     VAR_phase_minus_two_uxn_device_h_l132_c2_c53b := VAR_BIN_OP_MINUS_uxn_device_h_l132_c20_13fb_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l139_c21_0b07_return_output, 6);
     VAR_result_u16_addr_uxn_device_h_l148_c3_ddcb := resize(VAR_BIN_OP_PLUS_uxn_device_h_l148_c21_bcf2_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_right := VAR_MUX_uxn_device_h_l140_c13_0b61_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_right := VAR_MUX_uxn_device_h_l141_c13_819c_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_right := VAR_MUX_uxn_device_h_l151_c41_4f71_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_left := VAR_uint12_2_0_uxn_device_h_l131_c20_d4df_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_left := VAR_uint12_2_0_uxn_device_h_l131_c20_d4df_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_left := VAR_uint12_2_0_uxn_device_h_l131_c20_d4df_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l131_c20_d4df_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_left := VAR_uint12_7_3_uxn_device_h_l130_c20_9861_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_left := VAR_uint12_7_3_uxn_device_h_l130_c20_9861_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint12_7_3_uxn_device_h_l130_c20_9861_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l132_c2_c53b, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l132_c2_c53b;
     VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iftrue := VAR_result_u16_addr_uxn_device_h_l148_c3_ddcb;
     -- BIN_OP_PLUS[uxn_device_h_l141_c7_a84e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_left;
     BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output := BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l139_c12_bc2e] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output;

     -- uint12_7_3[uxn_device_h_l134_c6_db4c] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l134_c6_db4c_return_output := uint12_7_3(
     VAR_phase_minus_two_uxn_device_h_l132_c2_c53b);

     -- BIN_OP_EQ[uxn_device_h_l151_c7_2ba2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_left;
     BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output := BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l144_c6_a358] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l144_c6_a358_left <= VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_left;
     BIN_OP_EQ_uxn_device_h_l144_c6_a358_right <= VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output := BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l150_c46_2b2e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_left;
     BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output := BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c7_c3df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c7_c3df_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_left;
     BIN_OP_EQ_uxn_device_h_l150_c7_c3df_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output := BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output;

     -- BIN_OP_EQ[uxn_device_h_l158_c7_0436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l158_c7_0436_left <= VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_left;
     BIN_OP_EQ_uxn_device_h_l158_c7_0436_right <= VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output := BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output;

     -- MUX[uxn_device_h_l159_c25_a8b3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l159_c25_a8b3_cond <= VAR_MUX_uxn_device_h_l159_c25_a8b3_cond;
     MUX_uxn_device_h_l159_c25_a8b3_iftrue <= VAR_MUX_uxn_device_h_l159_c25_a8b3_iftrue;
     MUX_uxn_device_h_l159_c25_a8b3_iffalse <= VAR_MUX_uxn_device_h_l159_c25_a8b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l159_c25_a8b3_return_output := MUX_uxn_device_h_l159_c25_a8b3_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l135_c3_cae2] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l151_c35_f820] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l151_c35_f820_left <= VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_left;
     BIN_OP_PLUS_uxn_device_h_l151_c35_f820_right <= VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output := BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l140_c7_fb64] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_left <= VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_left;
     BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_right <= VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output := BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_x_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_y_MUX_uxn_device_h_l144_c2_4df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c6_a358_return_output;
     VAR_MUX_uxn_device_h_l150_c7_4379_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c7_c3df_return_output;
     VAR_MUX_uxn_device_h_l151_c7_2059_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c7_2ba2_return_output;
     VAR_MUX_uxn_device_h_l158_c7_b138_cond := VAR_BIN_OP_EQ_uxn_device_h_l158_c7_0436_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l150_c46_2b2e_return_output, 3);
     VAR_x_uxn_device_h_l140_c3_d4c2 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_fb64_return_output, 16);
     VAR_y_uxn_device_h_l141_c3_db29 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l141_c7_a84e_return_output, 16);
     VAR_MUX_uxn_device_h_l151_c7_2059_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l151_c35_f820_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_MUX_uxn_device_h_l159_c25_a8b3_return_output;
     VAR_opaque_uxn_device_h_l139_c3_80c7 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l139_c12_bc2e_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_left := VAR_uint12_7_3_uxn_device_h_l134_c6_db4c_return_output;
     VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_iftrue := VAR_opaque_uxn_device_h_l139_c3_80c7;
     VAR_x_MUX_uxn_device_h_l138_c2_88e3_iftrue := VAR_x_uxn_device_h_l140_c3_d4c2;
     VAR_y_MUX_uxn_device_h_l138_c2_88e3_iftrue := VAR_y_uxn_device_h_l141_c3_db29;
     -- BIN_OP_EQ[uxn_device_h_l134_c6_703f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c6_703f_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_left;
     BIN_OP_EQ_uxn_device_h_l134_c6_703f_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output := BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output;

     -- y_MUX[uxn_device_h_l138_c2_88e3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c2_88e3_cond <= VAR_y_MUX_uxn_device_h_l138_c2_88e3_cond;
     y_MUX_uxn_device_h_l138_c2_88e3_iftrue <= VAR_y_MUX_uxn_device_h_l138_c2_88e3_iftrue;
     y_MUX_uxn_device_h_l138_c2_88e3_iffalse <= VAR_y_MUX_uxn_device_h_l138_c2_88e3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output := y_MUX_uxn_device_h_l138_c2_88e3_return_output;

     -- x_MUX[uxn_device_h_l138_c2_88e3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c2_88e3_cond <= VAR_x_MUX_uxn_device_h_l138_c2_88e3_cond;
     x_MUX_uxn_device_h_l138_c2_88e3_iftrue <= VAR_x_MUX_uxn_device_h_l138_c2_88e3_iftrue;
     x_MUX_uxn_device_h_l138_c2_88e3_iffalse <= VAR_x_MUX_uxn_device_h_l138_c2_88e3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c2_88e3_return_output := x_MUX_uxn_device_h_l138_c2_88e3_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l134_c2_789d] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l134_c2_789d_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l135_c3_cae2_return_output);

     -- opaque_MUX[uxn_device_h_l138_c2_88e3] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l138_c2_88e3_cond <= VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_cond;
     opaque_MUX_uxn_device_h_l138_c2_88e3_iftrue <= VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_iftrue;
     opaque_MUX_uxn_device_h_l138_c2_88e3_iffalse <= VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_return_output := opaque_MUX_uxn_device_h_l138_c2_88e3_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_cond;
     result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output := result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c6_703f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_left := VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l138_c2_88e3_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l134_c2_789d_return_output;
     VAR_MUX_uxn_device_h_l151_c7_2059_iffalse := VAR_x_MUX_uxn_device_h_l138_c2_88e3_return_output;
     VAR_x_MUX_uxn_device_h_l144_c2_4df3_iftrue := VAR_x_MUX_uxn_device_h_l138_c2_88e3_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_left := VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_left := VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output;
     VAR_MUX_uxn_device_h_l158_c7_b138_iffalse := VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output;
     VAR_y_MUX_uxn_device_h_l144_c2_4df3_iftrue := VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output;
     -- uint16_15_8[uxn_device_h_l153_c20_c0ca] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l153_c20_c0ca_return_output := uint16_15_8(
     VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output);

     -- MUX[uxn_device_h_l151_c7_2059] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l151_c7_2059_cond <= VAR_MUX_uxn_device_h_l151_c7_2059_cond;
     MUX_uxn_device_h_l151_c7_2059_iftrue <= VAR_MUX_uxn_device_h_l151_c7_2059_iftrue;
     MUX_uxn_device_h_l151_c7_2059_iffalse <= VAR_MUX_uxn_device_h_l151_c7_2059_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l151_c7_2059_return_output := MUX_uxn_device_h_l151_c7_2059_return_output;

     -- uint16_7_0[uxn_device_h_l154_c39_0c95] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l154_c39_0c95_return_output := uint16_7_0(
     VAR_y_MUX_uxn_device_h_l138_c2_88e3_return_output);

     -- BIN_OP_MINUS[uxn_device_h_l158_c41_f939] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l158_c41_f939_left <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_left;
     BIN_OP_MINUS_uxn_device_h_l158_c41_f939_right <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output := BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l158_c51_f399] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l158_c51_f399_left <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_left;
     BIN_OP_PLUS_uxn_device_h_l158_c51_f399_right <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output := BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output;

     -- sprite_rows_MUX[uxn_device_h_l134_c2_789d] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l134_c2_789d_cond <= VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_cond;
     sprite_rows_MUX_uxn_device_h_l134_c2_789d_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_iftrue;
     sprite_rows_MUX_uxn_device_h_l134_c2_789d_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output := sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l158_c35_35b6_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l158_c41_f939_return_output;
     VAR_MUX_uxn_device_h_l158_c35_35b6_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l158_c51_f399_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_left := VAR_MUX_uxn_device_h_l151_c7_2059_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_left := VAR_MUX_uxn_device_h_l151_c7_2059_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l134_c2_789d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_left := VAR_uint16_15_8_uxn_device_h_l153_c20_c0ca_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l161_c24_56b2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_left <= VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_left;
     BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_right <= VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output := BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output;

     -- uint16_7_0[uxn_device_h_l155_c53_c918] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l155_c53_c918_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l151_c7_2059_return_output);

     -- uint16_15_8[uxn_device_h_l152_c20_0348] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l152_c20_0348_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l151_c7_2059_return_output);

     -- MUX[uxn_device_h_l158_c35_35b6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l158_c35_35b6_cond <= VAR_MUX_uxn_device_h_l158_c35_35b6_cond;
     MUX_uxn_device_h_l158_c35_35b6_iftrue <= VAR_MUX_uxn_device_h_l158_c35_35b6_iftrue;
     MUX_uxn_device_h_l158_c35_35b6_iffalse <= VAR_MUX_uxn_device_h_l158_c35_35b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l158_c35_35b6_return_output := MUX_uxn_device_h_l158_c35_35b6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l153_c20_492c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l153_c20_492c_left <= VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_left;
     BIN_OP_EQ_uxn_device_h_l153_c20_492c_right <= VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output := BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output;

     -- uint16_uint8_8[uxn_device_h_l154_c21_a4f9] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l154_c21_a4f9_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_uint16_7_0_uxn_device_h_l154_c39_0c95_return_output);

     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l150_c34_92e3] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l161_c14_0ccc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_left <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_left;
     BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_right <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output := BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l153_c20_67c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c20_492c_return_output;
     VAR_MUX_uxn_device_h_l161_c8_2d69_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l161_c24_56b2_return_output;
     VAR_MUX_uxn_device_h_l161_c8_2d69_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l161_c14_0ccc_return_output, 16);
     VAR_MUX_uxn_device_h_l158_c7_b138_iftrue := VAR_MUX_uxn_device_h_l158_c35_35b6_return_output;
     VAR_MUX_uxn_device_h_l150_c7_4379_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l150_c34_92e3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_left := VAR_uint16_15_8_uxn_device_h_l152_c20_0348_return_output;
     -- MUX[uxn_device_h_l150_c7_4379] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l150_c7_4379_cond <= VAR_MUX_uxn_device_h_l150_c7_4379_cond;
     MUX_uxn_device_h_l150_c7_4379_iftrue <= VAR_MUX_uxn_device_h_l150_c7_4379_iftrue;
     MUX_uxn_device_h_l150_c7_4379_iffalse <= VAR_MUX_uxn_device_h_l150_c7_4379_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l150_c7_4379_return_output := MUX_uxn_device_h_l150_c7_4379_return_output;

     -- MUX[uxn_device_h_l153_c20_67c6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c20_67c6_cond <= VAR_MUX_uxn_device_h_l153_c20_67c6_cond;
     MUX_uxn_device_h_l153_c20_67c6_iftrue <= VAR_MUX_uxn_device_h_l153_c20_67c6_iftrue;
     MUX_uxn_device_h_l153_c20_67c6_iffalse <= VAR_MUX_uxn_device_h_l153_c20_67c6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c20_67c6_return_output := MUX_uxn_device_h_l153_c20_67c6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c20_12c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c20_12c3_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_left;
     BIN_OP_EQ_uxn_device_h_l152_c20_12c3_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output := BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output;

     -- MUX[uxn_device_h_l161_c8_2d69] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l161_c8_2d69_cond <= VAR_MUX_uxn_device_h_l161_c8_2d69_cond;
     MUX_uxn_device_h_l161_c8_2d69_iftrue <= VAR_MUX_uxn_device_h_l161_c8_2d69_iftrue;
     MUX_uxn_device_h_l161_c8_2d69_iffalse <= VAR_MUX_uxn_device_h_l161_c8_2d69_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l161_c8_2d69_return_output := MUX_uxn_device_h_l161_c8_2d69_return_output;

     -- uint16_uint8_0[uxn_device_h_l155_c21_68a8] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l155_c21_68a8_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l154_c21_a4f9_return_output,
     VAR_uint16_7_0_uxn_device_h_l155_c53_c918_return_output);

     -- MUX[uxn_device_h_l158_c7_b138] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l158_c7_b138_cond <= VAR_MUX_uxn_device_h_l158_c7_b138_cond;
     MUX_uxn_device_h_l158_c7_b138_iftrue <= VAR_MUX_uxn_device_h_l158_c7_b138_iftrue;
     MUX_uxn_device_h_l158_c7_b138_iffalse <= VAR_MUX_uxn_device_h_l158_c7_b138_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l158_c7_b138_return_output := MUX_uxn_device_h_l158_c7_b138_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l152_c20_3491_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c20_12c3_return_output;
     VAR_CONST_SR_1_uxn_device_h_l160_c3_d483_x := VAR_MUX_uxn_device_h_l150_c7_4379_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_right := VAR_MUX_uxn_device_h_l153_c20_67c6_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_MUX_uxn_device_h_l153_c20_67c6_return_output;
     VAR_y_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_MUX_uxn_device_h_l158_c7_b138_return_output;
     VAR_x_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_MUX_uxn_device_h_l161_c8_2d69_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_uint16_uint8_0_uxn_device_h_l155_c21_68a8_return_output;
     -- result_u16_addr_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_cond;
     result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output := result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- y_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_y_MUX_uxn_device_h_l144_c2_4df3_cond;
     y_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_y_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     y_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_y_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c2_4df3_return_output := y_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- uint8_0_0_uxn_device_h_l156_l157_DUPLICATE_80b8 LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l156_l157_DUPLICATE_80b8_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l150_c7_4379_return_output);

     -- is_y_in_bounds_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond;
     is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output := is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- CONST_SR_1[uxn_device_h_l160_c3_d483] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l160_c3_d483_x <= VAR_CONST_SR_1_uxn_device_h_l160_c3_d483_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l160_c3_d483_return_output := CONST_SR_1_uxn_device_h_l160_c3_d483_return_output;

     -- x_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_x_MUX_uxn_device_h_l144_c2_4df3_cond;
     x_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_x_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     x_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_x_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c2_4df3_return_output := x_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- MUX[uxn_device_h_l152_c20_3491] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l152_c20_3491_cond <= VAR_MUX_uxn_device_h_l152_c20_3491_cond;
     MUX_uxn_device_h_l152_c20_3491_iftrue <= VAR_MUX_uxn_device_h_l152_c20_3491_iftrue;
     MUX_uxn_device_h_l152_c20_3491_iffalse <= VAR_MUX_uxn_device_h_l152_c20_3491_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l152_c20_3491_return_output := MUX_uxn_device_h_l152_c20_3491_return_output;

     -- Submodule level 7
     VAR_c_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_CONST_SR_1_uxn_device_h_l160_c3_d483_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_left := VAR_MUX_uxn_device_h_l152_c20_3491_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_MUX_uxn_device_h_l152_c20_3491_return_output;
     REG_VAR_is_y_in_bounds := VAR_is_y_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_right := VAR_uint8_0_0_uxn_device_h_l156_l157_DUPLICATE_80b8_return_output;
     VAR_MUX_uxn_device_h_l157_c40_eb92_cond := VAR_uint8_0_0_uxn_device_h_l156_l157_DUPLICATE_80b8_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l144_c2_4df3_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l144_c2_4df3_return_output;
     -- is_x_in_bounds_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_cond;
     is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output := is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- BIN_OP_OR[uxn_device_h_l156_c61_73d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l156_c61_73d9_left <= VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_left;
     BIN_OP_OR_uxn_device_h_l156_c61_73d9_right <= VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output := BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output;

     -- MUX[uxn_device_h_l157_c40_eb92] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l157_c40_eb92_cond <= VAR_MUX_uxn_device_h_l157_c40_eb92_cond;
     MUX_uxn_device_h_l157_c40_eb92_iftrue <= VAR_MUX_uxn_device_h_l157_c40_eb92_iftrue;
     MUX_uxn_device_h_l157_c40_eb92_iffalse <= VAR_MUX_uxn_device_h_l157_c40_eb92_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l157_c40_eb92_return_output := MUX_uxn_device_h_l157_c40_eb92_return_output;

     -- c_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_c_MUX_uxn_device_h_l144_c2_4df3_cond;
     c_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_c_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     c_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_c_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l144_c2_4df3_return_output := c_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- BIN_OP_AND[uxn_device_h_l156_c26_c1c5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l156_c26_c1c5_left <= VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_left;
     BIN_OP_AND_uxn_device_h_l156_c26_c1c5_right <= VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output := BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_left := VAR_BIN_OP_AND_uxn_device_h_l156_c26_c1c5_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_right := VAR_BIN_OP_OR_uxn_device_h_l156_c61_73d9_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_right := VAR_MUX_uxn_device_h_l157_c40_eb92_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l144_c2_4df3_return_output;
     REG_VAR_is_x_in_bounds := VAR_is_x_in_bounds_MUX_uxn_device_h_l144_c2_4df3_return_output;
     -- BIN_OP_AND[uxn_device_h_l156_c26_6a8e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l156_c26_6a8e_left <= VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_left;
     BIN_OP_AND_uxn_device_h_l156_c26_6a8e_right <= VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output := BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c30_7c1d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_left;
     BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output := BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output;

     -- Submodule level 9
     VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_BIN_OP_AND_uxn_device_h_l156_c26_6a8e_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c30_7c1d_return_output, 6);
     -- result_is_vram_write_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_cond;
     result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output := result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l157_c21_bf03] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output;

     -- Submodule level 10
     VAR_result_u8_value_uxn_device_h_l157_c3_587a := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l157_c21_bf03_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iffalse := VAR_result_u8_value_uxn_device_h_l157_c3_587a;
     -- result_u8_value_MUX[uxn_device_h_l144_c2_4df3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c2_4df3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_cond;
     result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output := result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l110_l164_DUPLICATE_9eed LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l110_l164_DUPLICATE_9eed_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l144_c2_4df3_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l144_c2_4df3_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l144_c2_4df3_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l144_c2_4df3_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l110_l164_DUPLICATE_9eed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l110_l164_DUPLICATE_9eed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_opaque <= REG_VAR_opaque;
REG_COMB_c <= REG_VAR_c;
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
REG_COMB_is_x_in_bounds <= REG_VAR_is_x_in_bounds;
REG_COMB_is_y_in_bounds <= REG_VAR_is_y_in_bounds;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     opaque <= REG_COMB_opaque;
     c <= REG_COMB_c;
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
     is_x_in_bounds <= REG_COMB_is_x_in_bounds;
     is_y_in_bounds <= REG_COMB_is_y_in_bounds;
 end if;
 end if;
end process;

end arch;
