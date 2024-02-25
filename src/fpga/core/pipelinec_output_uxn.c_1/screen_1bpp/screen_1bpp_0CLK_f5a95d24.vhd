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
-- Submodules: 54
entity screen_1bpp_0CLK_f5a95d24 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 x1 : in unsigned(7 downto 0);
 y1 : in unsigned(7 downto 0);
 color : in unsigned(3 downto 0);
 fx : in unsigned(0 downto 0);
 fy : in unsigned(0 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_1bpp_0CLK_f5a95d24;
architecture arch of screen_1bpp_0CLK_f5a95d24 is
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
signal xmod : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_8 := (others => to_unsigned(0, 8));
signal REG_COMB_blending : uint2_t_48;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_xmod : unsigned(7 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(7 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_8;

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l124_c20_e432]
signal BIN_OP_MINUS_uxn_device_h_l124_c20_e432_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l124_c20_e432_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l126_c6_8390]
signal BIN_OP_EQ_uxn_device_h_l126_c6_8390_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c6_8390_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l126_c2_ecc1]
signal sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l127_c3_be3b]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output : uint8_t_array_8_t;

-- BIN_OP_EQ[uxn_device_h_l130_c6_b256]
signal BIN_OP_EQ_uxn_device_h_l130_c6_b256_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c6_b256_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l130_c2_0e57]
signal x_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l130_c2_0e57]
signal opaque_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l130_c2_0e57]
signal y_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(15 downto 0);

-- xmod_MUX[uxn_device_h_l130_c2_0e57]
signal xmod_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
signal xmod_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l131_c21_26be]
signal BIN_OP_PLUS_uxn_device_h_l131_c21_26be_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l131_c21_26be_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l131_c12_457b]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l132_c10_f083]
signal MUX_uxn_device_h_l132_c10_f083_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l132_c10_f083_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l132_c10_f083_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l132_c10_f083_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l133_c7_445e]
signal BIN_OP_PLUS_uxn_device_h_l133_c7_445e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l133_c7_445e_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l134_c13_2327]
signal MUX_uxn_device_h_l134_c13_2327_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l134_c13_2327_iftrue : unsigned(2 downto 0);
signal MUX_uxn_device_h_l134_c13_2327_iffalse : unsigned(2 downto 0);
signal MUX_uxn_device_h_l134_c13_2327_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l134_c7_36f1]
signal BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c6_0e19]
signal BIN_OP_EQ_uxn_device_h_l137_c6_0e19_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c6_0e19_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l137_c2_3d33]
signal x_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(15 downto 0);

-- c_MUX[uxn_device_h_l137_c2_3d33]
signal c_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c2_3d33]
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l137_c2_3d33]
signal result_u8_value_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l137_c2_3d33]
signal result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l137_c2_3d33]
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l137_c2_3d33]
signal y_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l141_c21_d4b5]
signal BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_c8c8]
signal BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l143_c46_70d8]
signal BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l143_c34_76df]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l143_c7_f415]
signal MUX_uxn_device_h_l143_c7_f415_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l143_c7_f415_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l143_c7_f415_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l143_c7_f415_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l144_c7_ff9f]
signal BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l144_c35_53dd]
signal BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l144_c7_9139]
signal MUX_uxn_device_h_l144_c7_9139_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l144_c7_9139_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l144_c7_9139_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l144_c7_9139_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_device_h_l145_c22_c513]
signal CONST_SL_8_uxn_device_h_l145_c22_c513_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l145_c22_c513_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c22_153f]
signal BIN_OP_PLUS_uxn_device_h_l145_c22_153f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c22_153f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_device_h_l146_c26_b96f]
signal BIN_OP_OR_uxn_device_h_l146_c26_b96f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c26_b96f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c40_cd94]
signal MUX_uxn_device_h_l147_c40_cd94_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c40_cd94_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c40_cd94_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c40_cd94_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c30_980f]
signal BIN_OP_PLUS_uxn_device_h_l147_c30_980f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c30_980f_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l147_c21_2e40]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c7_47cf]
signal BIN_OP_EQ_uxn_device_h_l148_c7_47cf_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_47cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l148_c41_f99c]
signal BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l148_c51_634f]
signal BIN_OP_PLUS_uxn_device_h_l148_c51_634f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l148_c51_634f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l148_c35_d146]
signal MUX_uxn_device_h_l148_c35_d146_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l148_c35_d146_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c35_d146_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c35_d146_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l148_c7_689b]
signal MUX_uxn_device_h_l148_c7_689b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l148_c7_689b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c7_689b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c7_689b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l149_c25_0b9a]
signal BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l149_c25_8547]
signal MUX_uxn_device_h_l149_c25_8547_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c25_8547_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c25_8547_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c25_8547_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l150_c3_e3aa]
signal CONST_SR_1_uxn_device_h_l150_c3_e3aa_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l151_c14_10d8]
signal BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l151_c24_19a1]
signal BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l151_c8_6605]
signal MUX_uxn_device_h_l151_c8_6605_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c8_6605_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c8_6605_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c8_6605_return_output : unsigned(15 downto 0);

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

function uint8_7_3( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5( ref_toks_0 : uint8_t_array_8_t) return uint8_t_8 is
 
  variable base : uint8_t_8; 
  variable return_output : uint8_t_8;
begin
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(1) := ref_toks_0.data(1);
      base(4) := ref_toks_0.data(4);
      base(7) := ref_toks_0.data(7);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);

      return_output := base;
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
-- BIN_OP_MINUS_uxn_device_h_l124_c20_e432
BIN_OP_MINUS_uxn_device_h_l124_c20_e432 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l124_c20_e432_left,
BIN_OP_MINUS_uxn_device_h_l124_c20_e432_right,
BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output);

-- BIN_OP_EQ_uxn_device_h_l126_c6_8390
BIN_OP_EQ_uxn_device_h_l126_c6_8390 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l126_c6_8390_left,
BIN_OP_EQ_uxn_device_h_l126_c6_8390_right,
BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output);

-- sprite_rows_MUX_uxn_device_h_l126_c2_ecc1
sprite_rows_MUX_uxn_device_h_l126_c2_ecc1 : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_cond,
sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iftrue,
sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iffalse,
sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c6_b256
BIN_OP_EQ_uxn_device_h_l130_c6_b256 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c6_b256_left,
BIN_OP_EQ_uxn_device_h_l130_c6_b256_right,
BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output);

-- x_MUX_uxn_device_h_l130_c2_0e57
x_MUX_uxn_device_h_l130_c2_0e57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l130_c2_0e57_cond,
x_MUX_uxn_device_h_l130_c2_0e57_iftrue,
x_MUX_uxn_device_h_l130_c2_0e57_iffalse,
x_MUX_uxn_device_h_l130_c2_0e57_return_output);

-- opaque_MUX_uxn_device_h_l130_c2_0e57
opaque_MUX_uxn_device_h_l130_c2_0e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l130_c2_0e57_cond,
opaque_MUX_uxn_device_h_l130_c2_0e57_iftrue,
opaque_MUX_uxn_device_h_l130_c2_0e57_iffalse,
opaque_MUX_uxn_device_h_l130_c2_0e57_return_output);

-- y_MUX_uxn_device_h_l130_c2_0e57
y_MUX_uxn_device_h_l130_c2_0e57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c2_0e57_cond,
y_MUX_uxn_device_h_l130_c2_0e57_iftrue,
y_MUX_uxn_device_h_l130_c2_0e57_iffalse,
y_MUX_uxn_device_h_l130_c2_0e57_return_output);

-- xmod_MUX_uxn_device_h_l130_c2_0e57
xmod_MUX_uxn_device_h_l130_c2_0e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
xmod_MUX_uxn_device_h_l130_c2_0e57_cond,
xmod_MUX_uxn_device_h_l130_c2_0e57_iftrue,
xmod_MUX_uxn_device_h_l130_c2_0e57_iffalse,
xmod_MUX_uxn_device_h_l130_c2_0e57_return_output);

-- BIN_OP_PLUS_uxn_device_h_l131_c21_26be
BIN_OP_PLUS_uxn_device_h_l131_c21_26be : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l131_c21_26be_left,
BIN_OP_PLUS_uxn_device_h_l131_c21_26be_right,
BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output);

-- MUX_uxn_device_h_l132_c10_f083
MUX_uxn_device_h_l132_c10_f083 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l132_c10_f083_cond,
MUX_uxn_device_h_l132_c10_f083_iftrue,
MUX_uxn_device_h_l132_c10_f083_iffalse,
MUX_uxn_device_h_l132_c10_f083_return_output);

-- BIN_OP_PLUS_uxn_device_h_l133_c7_445e
BIN_OP_PLUS_uxn_device_h_l133_c7_445e : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l133_c7_445e_left,
BIN_OP_PLUS_uxn_device_h_l133_c7_445e_right,
BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output);

-- MUX_uxn_device_h_l134_c13_2327
MUX_uxn_device_h_l134_c13_2327 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l134_c13_2327_cond,
MUX_uxn_device_h_l134_c13_2327_iftrue,
MUX_uxn_device_h_l134_c13_2327_iffalse,
MUX_uxn_device_h_l134_c13_2327_return_output);

-- BIN_OP_PLUS_uxn_device_h_l134_c7_36f1
BIN_OP_PLUS_uxn_device_h_l134_c7_36f1 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_left,
BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_right,
BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c6_0e19
BIN_OP_EQ_uxn_device_h_l137_c6_0e19 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c6_0e19_left,
BIN_OP_EQ_uxn_device_h_l137_c6_0e19_right,
BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output);

-- x_MUX_uxn_device_h_l137_c2_3d33
x_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l137_c2_3d33_cond,
x_MUX_uxn_device_h_l137_c2_3d33_iftrue,
x_MUX_uxn_device_h_l137_c2_3d33_iffalse,
x_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- c_MUX_uxn_device_h_l137_c2_3d33
c_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l137_c2_3d33_cond,
c_MUX_uxn_device_h_l137_c2_3d33_iftrue,
c_MUX_uxn_device_h_l137_c2_3d33_iffalse,
c_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33
result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- result_u8_value_MUX_uxn_device_h_l137_c2_3d33
result_u8_value_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l137_c2_3d33_cond,
result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iftrue,
result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iffalse,
result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- result_u16_addr_MUX_uxn_device_h_l137_c2_3d33
result_u16_addr_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_cond,
result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iftrue,
result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iffalse,
result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33
result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_cond,
result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iftrue,
result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iffalse,
result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- y_MUX_uxn_device_h_l137_c2_3d33
y_MUX_uxn_device_h_l137_c2_3d33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c2_3d33_cond,
y_MUX_uxn_device_h_l137_c2_3d33_iftrue,
y_MUX_uxn_device_h_l137_c2_3d33_iffalse,
y_MUX_uxn_device_h_l137_c2_3d33_return_output);

-- BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5
BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5 : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_left,
BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_right,
BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_c8c8
BIN_OP_EQ_uxn_device_h_l143_c7_c8c8 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_left,
BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_right,
BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output);

-- BIN_OP_MINUS_uxn_device_h_l143_c46_70d8
BIN_OP_MINUS_uxn_device_h_l143_c46_70d8 : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_left,
BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_right,
BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output);

-- MUX_uxn_device_h_l143_c7_f415
MUX_uxn_device_h_l143_c7_f415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l143_c7_f415_cond,
MUX_uxn_device_h_l143_c7_f415_iftrue,
MUX_uxn_device_h_l143_c7_f415_iffalse,
MUX_uxn_device_h_l143_c7_f415_return_output);

-- BIN_OP_EQ_uxn_device_h_l144_c7_ff9f
BIN_OP_EQ_uxn_device_h_l144_c7_ff9f : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_left,
BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_right,
BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l144_c35_53dd
BIN_OP_PLUS_uxn_device_h_l144_c35_53dd : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_left,
BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_right,
BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output);

-- MUX_uxn_device_h_l144_c7_9139
MUX_uxn_device_h_l144_c7_9139 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l144_c7_9139_cond,
MUX_uxn_device_h_l144_c7_9139_iftrue,
MUX_uxn_device_h_l144_c7_9139_iffalse,
MUX_uxn_device_h_l144_c7_9139_return_output);

-- CONST_SL_8_uxn_device_h_l145_c22_c513
CONST_SL_8_uxn_device_h_l145_c22_c513 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l145_c22_c513_x,
CONST_SL_8_uxn_device_h_l145_c22_c513_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c22_153f
BIN_OP_PLUS_uxn_device_h_l145_c22_153f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c22_153f_left,
BIN_OP_PLUS_uxn_device_h_l145_c22_153f_right,
BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output);

-- BIN_OP_OR_uxn_device_h_l146_c26_b96f
BIN_OP_OR_uxn_device_h_l146_c26_b96f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l146_c26_b96f_left,
BIN_OP_OR_uxn_device_h_l146_c26_b96f_right,
BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output);

-- MUX_uxn_device_h_l147_c40_cd94
MUX_uxn_device_h_l147_c40_cd94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c40_cd94_cond,
MUX_uxn_device_h_l147_c40_cd94_iftrue,
MUX_uxn_device_h_l147_c40_cd94_iffalse,
MUX_uxn_device_h_l147_c40_cd94_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c30_980f
BIN_OP_PLUS_uxn_device_h_l147_c30_980f : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c30_980f_left,
BIN_OP_PLUS_uxn_device_h_l147_c30_980f_right,
BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c7_47cf
BIN_OP_EQ_uxn_device_h_l148_c7_47cf : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c7_47cf_left,
BIN_OP_EQ_uxn_device_h_l148_c7_47cf_right,
BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output);

-- BIN_OP_MINUS_uxn_device_h_l148_c41_f99c
BIN_OP_MINUS_uxn_device_h_l148_c41_f99c : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_left,
BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_right,
BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output);

-- BIN_OP_PLUS_uxn_device_h_l148_c51_634f
BIN_OP_PLUS_uxn_device_h_l148_c51_634f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l148_c51_634f_left,
BIN_OP_PLUS_uxn_device_h_l148_c51_634f_right,
BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output);

-- MUX_uxn_device_h_l148_c35_d146
MUX_uxn_device_h_l148_c35_d146 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l148_c35_d146_cond,
MUX_uxn_device_h_l148_c35_d146_iftrue,
MUX_uxn_device_h_l148_c35_d146_iffalse,
MUX_uxn_device_h_l148_c35_d146_return_output);

-- MUX_uxn_device_h_l148_c7_689b
MUX_uxn_device_h_l148_c7_689b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l148_c7_689b_cond,
MUX_uxn_device_h_l148_c7_689b_iftrue,
MUX_uxn_device_h_l148_c7_689b_iffalse,
MUX_uxn_device_h_l148_c7_689b_return_output);

-- BIN_OP_EQ_uxn_device_h_l149_c25_0b9a
BIN_OP_EQ_uxn_device_h_l149_c25_0b9a : entity work.BIN_OP_EQ_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_left,
BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_right,
BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output);

-- MUX_uxn_device_h_l149_c25_8547
MUX_uxn_device_h_l149_c25_8547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c25_8547_cond,
MUX_uxn_device_h_l149_c25_8547_iftrue,
MUX_uxn_device_h_l149_c25_8547_iffalse,
MUX_uxn_device_h_l149_c25_8547_return_output);

-- CONST_SR_1_uxn_device_h_l150_c3_e3aa
CONST_SR_1_uxn_device_h_l150_c3_e3aa : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l150_c3_e3aa_x,
CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output);

-- BIN_OP_PLUS_uxn_device_h_l151_c14_10d8
BIN_OP_PLUS_uxn_device_h_l151_c14_10d8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_left,
BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_right,
BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output);

-- BIN_OP_MINUS_uxn_device_h_l151_c24_19a1
BIN_OP_MINUS_uxn_device_h_l151_c24_19a1 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_left,
BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_right,
BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output);

-- MUX_uxn_device_h_l151_c8_6605
MUX_uxn_device_h_l151_c8_6605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l151_c8_6605_cond,
MUX_uxn_device_h_l151_c8_6605_iftrue,
MUX_uxn_device_h_l151_c8_6605_iffalse,
MUX_uxn_device_h_l151_c8_6605_return_output);



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
 xmod,
 opaque,
 c,
 color8,
 result,
 phase_minus_two,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output,
 BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output,
 sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output,
 x_MUX_uxn_device_h_l130_c2_0e57_return_output,
 opaque_MUX_uxn_device_h_l130_c2_0e57_return_output,
 y_MUX_uxn_device_h_l130_c2_0e57_return_output,
 xmod_MUX_uxn_device_h_l130_c2_0e57_return_output,
 BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output,
 MUX_uxn_device_h_l132_c10_f083_return_output,
 BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output,
 MUX_uxn_device_h_l134_c13_2327_return_output,
 BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output,
 x_MUX_uxn_device_h_l137_c2_3d33_return_output,
 c_MUX_uxn_device_h_l137_c2_3d33_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output,
 result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output,
 result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output,
 result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output,
 y_MUX_uxn_device_h_l137_c2_3d33_return_output,
 BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output,
 BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output,
 MUX_uxn_device_h_l143_c7_f415_return_output,
 BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output,
 BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output,
 MUX_uxn_device_h_l144_c7_9139_return_output,
 CONST_SL_8_uxn_device_h_l145_c22_c513_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output,
 BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output,
 MUX_uxn_device_h_l147_c40_cd94_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output,
 BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output,
 BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output,
 MUX_uxn_device_h_l148_c35_d146_return_output,
 MUX_uxn_device_h_l148_c7_689b_return_output,
 BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output,
 MUX_uxn_device_h_l149_c25_8547_return_output,
 CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output,
 BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output,
 BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output,
 MUX_uxn_device_h_l151_c8_6605_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_x1 : unsigned(7 downto 0);
 variable VAR_y1 : unsigned(7 downto 0);
 variable VAR_color : unsigned(3 downto 0);
 variable VAR_fx : unsigned(0 downto 0);
 variable VAR_fy : unsigned(0 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_color8_uxn_device_h_l121_c2_10fa : unsigned(7 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l122_c20_ab2a_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l123_c20_de86_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l124_c2_5ae5 : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_left : unsigned(4 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l126_c6_89c6_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l126_c2_ecc1_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_var_dim_0 : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l133_c3_15b5 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l131_c3_c195 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l134_c3_c7be : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_iftrue : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_iffalse : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_return_output : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l132_c10_f083_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l132_c10_f083_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l132_c10_f083_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l132_c10_f083_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_2327_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_2327_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_2327_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_2327_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l139_c3_7a5b : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l147_c3_5064 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l141_c3_47a3 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l145_c3_6c0a : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_3d33_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_3d33_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_3d33_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_3d33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c7_f415_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c7_f415_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_ref_toks_0 : uint8_t_8;
 variable VAR_MUX_uxn_device_h_l143_c7_f415_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_9139_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_9139_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_9139_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_9139_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l145_c22_c513_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l145_c22_c513_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_cd94_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_cd94_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_cd94_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_cd94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l148_c7_689b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_689b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_689b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_d146_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_d146_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_d146_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_d146_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_689b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_8547_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_8547_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_8547_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_8547_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l150_c3_e3aa_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_6605_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_6605_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_6605_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_6605_return_output : unsigned(15 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_afa9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l154_l103_DUPLICATE_686e_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint2_t_48;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_xmod : unsigned(7 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(7 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_8;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_xmod := xmod;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_right := to_unsigned(0, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l149_c25_8547_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l134_c13_2327_iffalse := resize(to_unsigned(0, 1), 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l147_c40_cd94_iftrue := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_right := to_unsigned(71, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l132_c10_f083_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l149_c25_8547_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_left := to_unsigned(32, 8);
     VAR_MUX_uxn_device_h_l147_c40_cd94_iffalse := to_unsigned(0, 8);
     VAR_result_u8_value_uxn_device_h_l139_c3_7a5b := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iftrue := VAR_result_u8_value_uxn_device_h_l139_c3_7a5b;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_right := to_unsigned(0, 1);
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l132_c10_f083_iffalse := resize(to_unsigned(7, 3), 8);
     VAR_MUX_uxn_device_h_l134_c13_2327_iftrue := to_unsigned(7, 3);

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
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l143_c7_f415_iffalse := c;
     VAR_c_MUX_uxn_device_h_l137_c2_3d33_iftrue := c;
     VAR_color8_uxn_device_h_l121_c2_10fa := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l132_c10_f083_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l151_c8_6605_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l134_c13_2327_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l148_c35_d146_cond := VAR_fy;
     VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l130_c2_0e57_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_left := VAR_x1;
     VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_iffalse := xmod;
     VAR_y_MUX_uxn_device_h_l130_c2_0e57_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_right := VAR_color8_uxn_device_h_l121_c2_10fa;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_left := VAR_color8_uxn_device_h_l121_c2_10fa;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l121_c2_10fa;
     -- MUX[uxn_device_h_l134_c13_2327] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l134_c13_2327_cond <= VAR_MUX_uxn_device_h_l134_c13_2327_cond;
     MUX_uxn_device_h_l134_c13_2327_iftrue <= VAR_MUX_uxn_device_h_l134_c13_2327_iftrue;
     MUX_uxn_device_h_l134_c13_2327_iffalse <= VAR_MUX_uxn_device_h_l134_c13_2327_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l134_c13_2327_return_output := MUX_uxn_device_h_l134_c13_2327_return_output;

     -- uint12_2_0[uxn_device_h_l123_c20_de86] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l123_c20_de86_return_output := uint12_2_0(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l149_c25_0b9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_left <= VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_left;
     BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_right <= VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output := BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l141_c21_d4b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_left <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_left;
     BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_right <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output := BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l131_c21_26be] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l131_c21_26be_left <= VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_left;
     BIN_OP_PLUS_uxn_device_h_l131_c21_26be_right <= VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output := BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output;

     -- MUX[uxn_device_h_l132_c10_f083] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l132_c10_f083_cond <= VAR_MUX_uxn_device_h_l132_c10_f083_cond;
     MUX_uxn_device_h_l132_c10_f083_iftrue <= VAR_MUX_uxn_device_h_l132_c10_f083_iftrue;
     MUX_uxn_device_h_l132_c10_f083_iffalse <= VAR_MUX_uxn_device_h_l132_c10_f083_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l132_c10_f083_return_output := MUX_uxn_device_h_l132_c10_f083_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l124_c20_e432] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l124_c20_e432_left <= VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_left;
     BIN_OP_MINUS_uxn_device_h_l124_c20_e432_right <= VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output := BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c6_b256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c6_b256_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_left;
     BIN_OP_EQ_uxn_device_h_l130_c6_b256_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output := BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output;

     -- uint12_7_3[uxn_device_h_l122_c20_ab2a] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l122_c20_ab2a_return_output := uint12_7_3(
     VAR_phase);

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output;
     VAR_x_MUX_uxn_device_h_l130_c2_0e57_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output;
     VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output;
     VAR_y_MUX_uxn_device_h_l130_c2_0e57_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_b256_return_output;
     VAR_MUX_uxn_device_h_l149_c25_8547_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c25_0b9a_return_output;
     VAR_phase_minus_two_uxn_device_h_l124_c2_5ae5 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_e432_return_output, 8);
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_26be_return_output, 6);
     VAR_result_u16_addr_uxn_device_h_l141_c3_47a3 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_d4b5_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_right := VAR_MUX_uxn_device_h_l132_c10_f083_return_output;
     VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_iftrue := VAR_MUX_uxn_device_h_l132_c10_f083_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_right := VAR_MUX_uxn_device_h_l134_c13_2327_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_left := VAR_uint12_2_0_uxn_device_h_l123_c20_de86_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_left := VAR_uint12_2_0_uxn_device_h_l123_c20_de86_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_left := VAR_uint12_2_0_uxn_device_h_l123_c20_de86_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l123_c20_de86_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_left := VAR_uint12_7_3_uxn_device_h_l122_c20_ab2a_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_left := VAR_uint12_7_3_uxn_device_h_l122_c20_ab2a_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint12_7_3_uxn_device_h_l122_c20_ab2a_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l124_c2_5ae5, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l124_c2_5ae5;
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iftrue := VAR_result_u16_addr_uxn_device_h_l141_c3_47a3;
     -- uint8_7_3[uxn_device_h_l126_c6_89c6] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l126_c6_89c6_return_output := uint8_7_3(
     VAR_phase_minus_two_uxn_device_h_l124_c2_5ae5);

     -- BIN_OP_MINUS[uxn_device_h_l143_c46_70d8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_left <= VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_left;
     BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_right <= VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output := BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l144_c7_ff9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_left <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_left;
     BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_right <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output := BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l134_c7_36f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_left <= VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_left;
     BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_right <= VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output := BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l131_c12_457b] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l133_c7_445e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l133_c7_445e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_left;
     BIN_OP_PLUS_uxn_device_h_l133_c7_445e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output := BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l127_c3_be3b] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c6_0e19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c6_0e19_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_left;
     BIN_OP_EQ_uxn_device_h_l137_c6_0e19_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output := BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;

     -- MUX[uxn_device_h_l149_c25_8547] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c25_8547_cond <= VAR_MUX_uxn_device_h_l149_c25_8547_cond;
     MUX_uxn_device_h_l149_c25_8547_iftrue <= VAR_MUX_uxn_device_h_l149_c25_8547_iftrue;
     MUX_uxn_device_h_l149_c25_8547_iffalse <= VAR_MUX_uxn_device_h_l149_c25_8547_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c25_8547_return_output := MUX_uxn_device_h_l149_c25_8547_return_output;

     -- xmod_MUX[uxn_device_h_l130_c2_0e57] LATENCY=0
     -- Inputs
     xmod_MUX_uxn_device_h_l130_c2_0e57_cond <= VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_cond;
     xmod_MUX_uxn_device_h_l130_c2_0e57_iftrue <= VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_iftrue;
     xmod_MUX_uxn_device_h_l130_c2_0e57_iffalse <= VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_iffalse;
     -- Outputs
     VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_return_output := xmod_MUX_uxn_device_h_l130_c2_0e57_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_c8c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l148_c7_47cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c7_47cf_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_left;
     BIN_OP_EQ_uxn_device_h_l148_c7_47cf_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output := BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_3d33_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_0e19_return_output;
     VAR_MUX_uxn_device_h_l143_c7_f415_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_c8c8_return_output;
     VAR_MUX_uxn_device_h_l144_c7_9139_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_ff9f_return_output;
     VAR_MUX_uxn_device_h_l148_c7_689b_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c7_47cf_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_70d8_return_output, 3);
     VAR_x_uxn_device_h_l133_c3_15b5 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_445e_return_output, 16);
     VAR_y_uxn_device_h_l134_c3_c7be := resize(VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_36f1_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_MUX_uxn_device_h_l149_c25_8547_return_output;
     VAR_opaque_uxn_device_h_l131_c3_c195 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_457b_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_left := VAR_uint8_7_3_uxn_device_h_l126_c6_89c6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_right := VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_return_output;
     REG_VAR_xmod := VAR_xmod_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_iftrue := VAR_opaque_uxn_device_h_l131_c3_c195;
     VAR_x_MUX_uxn_device_h_l130_c2_0e57_iftrue := VAR_x_uxn_device_h_l133_c3_15b5;
     VAR_y_MUX_uxn_device_h_l130_c2_0e57_iftrue := VAR_y_uxn_device_h_l134_c3_c7be;
     -- opaque_MUX[uxn_device_h_l130_c2_0e57] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l130_c2_0e57_cond <= VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_cond;
     opaque_MUX_uxn_device_h_l130_c2_0e57_iftrue <= VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_iftrue;
     opaque_MUX_uxn_device_h_l130_c2_0e57_iffalse <= VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_return_output := opaque_MUX_uxn_device_h_l130_c2_0e57_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l144_c35_53dd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_left;
     BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output := BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output;

     -- y_MUX[uxn_device_h_l130_c2_0e57] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c2_0e57_cond <= VAR_y_MUX_uxn_device_h_l130_c2_0e57_cond;
     y_MUX_uxn_device_h_l130_c2_0e57_iftrue <= VAR_y_MUX_uxn_device_h_l130_c2_0e57_iftrue;
     y_MUX_uxn_device_h_l130_c2_0e57_iffalse <= VAR_y_MUX_uxn_device_h_l130_c2_0e57_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output := y_MUX_uxn_device_h_l130_c2_0e57_return_output;

     -- BIN_OP_EQ[uxn_device_h_l126_c6_8390] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l126_c6_8390_left <= VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_left;
     BIN_OP_EQ_uxn_device_h_l126_c6_8390_right <= VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output := BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l126_c2_ecc1] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l126_c2_ecc1_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_be3b_return_output);

     -- result_is_blit_done_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_cond;
     result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output := result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- x_MUX[uxn_device_h_l130_c2_0e57] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l130_c2_0e57_cond <= VAR_x_MUX_uxn_device_h_l130_c2_0e57_cond;
     x_MUX_uxn_device_h_l130_c2_0e57_iftrue <= VAR_x_MUX_uxn_device_h_l130_c2_0e57_iftrue;
     x_MUX_uxn_device_h_l130_c2_0e57_iffalse <= VAR_x_MUX_uxn_device_h_l130_c2_0e57_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l130_c2_0e57_return_output := x_MUX_uxn_device_h_l130_c2_0e57_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c6_8390_return_output;
     VAR_MUX_uxn_device_h_l144_c7_9139_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_53dd_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_left := VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l126_c2_ecc1_return_output;
     VAR_MUX_uxn_device_h_l144_c7_9139_iffalse := VAR_x_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_3d33_iftrue := VAR_x_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_left := VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_left := VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_CONST_SL_8_uxn_device_h_l145_c22_c513_x := VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_MUX_uxn_device_h_l148_c7_689b_iffalse := VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_3d33_iftrue := VAR_y_MUX_uxn_device_h_l130_c2_0e57_return_output;
     -- MUX[uxn_device_h_l144_c7_9139] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l144_c7_9139_cond <= VAR_MUX_uxn_device_h_l144_c7_9139_cond;
     MUX_uxn_device_h_l144_c7_9139_iftrue <= VAR_MUX_uxn_device_h_l144_c7_9139_iftrue;
     MUX_uxn_device_h_l144_c7_9139_iffalse <= VAR_MUX_uxn_device_h_l144_c7_9139_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l144_c7_9139_return_output := MUX_uxn_device_h_l144_c7_9139_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l148_c51_634f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l148_c51_634f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_left;
     BIN_OP_PLUS_uxn_device_h_l148_c51_634f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output := BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l148_c41_f99c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_left <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_left;
     BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_right <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output := BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output;

     -- CONST_SL_8[uxn_device_h_l145_c22_c513] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l145_c22_c513_x <= VAR_CONST_SL_8_uxn_device_h_l145_c22_c513_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l145_c22_c513_return_output := CONST_SL_8_uxn_device_h_l145_c22_c513_return_output;

     -- sprite_rows_MUX[uxn_device_h_l126_c2_ecc1] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_cond <= VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_cond;
     sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iftrue;
     sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output := sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l148_c35_d146_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_f99c_return_output;
     VAR_MUX_uxn_device_h_l148_c35_d146_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_634f_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_left := VAR_CONST_SL_8_uxn_device_h_l145_c22_c513_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_left := VAR_MUX_uxn_device_h_l144_c7_9139_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_right := VAR_MUX_uxn_device_h_l144_c7_9139_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_left := VAR_MUX_uxn_device_h_l144_c7_9139_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l126_c2_ecc1_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l151_c14_10d8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_left <= VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_left;
     BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_right <= VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output := BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l151_c24_19a1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_left <= VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_left;
     BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_right <= VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output := BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output;

     -- MUX[uxn_device_h_l148_c35_d146] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l148_c35_d146_cond <= VAR_MUX_uxn_device_h_l148_c35_d146_cond;
     MUX_uxn_device_h_l148_c35_d146_iftrue <= VAR_MUX_uxn_device_h_l148_c35_d146_iftrue;
     MUX_uxn_device_h_l148_c35_d146_iffalse <= VAR_MUX_uxn_device_h_l148_c35_d146_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l148_c35_d146_return_output := MUX_uxn_device_h_l148_c35_d146_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l145_c22_153f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c22_153f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_left;
     BIN_OP_PLUS_uxn_device_h_l145_c22_153f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output := BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l143_c34_76df] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l151_c8_6605_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_19a1_return_output;
     VAR_result_u16_addr_uxn_device_h_l145_c3_6c0a := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_153f_return_output, 16);
     VAR_MUX_uxn_device_h_l151_c8_6605_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_10d8_return_output, 16);
     VAR_MUX_uxn_device_h_l148_c7_689b_iftrue := VAR_MUX_uxn_device_h_l148_c35_d146_return_output;
     VAR_MUX_uxn_device_h_l143_c7_f415_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_76df_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_result_u16_addr_uxn_device_h_l145_c3_6c0a;
     -- result_u16_addr_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_cond;
     result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output := result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- MUX[uxn_device_h_l151_c8_6605] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l151_c8_6605_cond <= VAR_MUX_uxn_device_h_l151_c8_6605_cond;
     MUX_uxn_device_h_l151_c8_6605_iftrue <= VAR_MUX_uxn_device_h_l151_c8_6605_iftrue;
     MUX_uxn_device_h_l151_c8_6605_iffalse <= VAR_MUX_uxn_device_h_l151_c8_6605_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l151_c8_6605_return_output := MUX_uxn_device_h_l151_c8_6605_return_output;

     -- MUX[uxn_device_h_l143_c7_f415] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l143_c7_f415_cond <= VAR_MUX_uxn_device_h_l143_c7_f415_cond;
     MUX_uxn_device_h_l143_c7_f415_iftrue <= VAR_MUX_uxn_device_h_l143_c7_f415_iftrue;
     MUX_uxn_device_h_l143_c7_f415_iffalse <= VAR_MUX_uxn_device_h_l143_c7_f415_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l143_c7_f415_return_output := MUX_uxn_device_h_l143_c7_f415_return_output;

     -- MUX[uxn_device_h_l148_c7_689b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l148_c7_689b_cond <= VAR_MUX_uxn_device_h_l148_c7_689b_cond;
     MUX_uxn_device_h_l148_c7_689b_iftrue <= VAR_MUX_uxn_device_h_l148_c7_689b_iftrue;
     MUX_uxn_device_h_l148_c7_689b_iffalse <= VAR_MUX_uxn_device_h_l148_c7_689b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l148_c7_689b_return_output := MUX_uxn_device_h_l148_c7_689b_return_output;

     -- Submodule level 6
     VAR_CONST_SR_1_uxn_device_h_l150_c3_e3aa_x := VAR_MUX_uxn_device_h_l143_c7_f415_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_MUX_uxn_device_h_l148_c7_689b_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_MUX_uxn_device_h_l151_c8_6605_return_output;
     -- uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_afa9 LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_afa9_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l143_c7_f415_return_output);

     -- x_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_x_MUX_uxn_device_h_l137_c2_3d33_cond;
     x_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_x_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     x_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_x_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l137_c2_3d33_return_output := x_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- y_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_y_MUX_uxn_device_h_l137_c2_3d33_cond;
     y_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_y_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     y_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_y_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c2_3d33_return_output := y_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- CONST_SR_1[uxn_device_h_l150_c3_e3aa] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l150_c3_e3aa_x <= VAR_CONST_SR_1_uxn_device_h_l150_c3_e3aa_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output := CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output;

     -- Submodule level 7
     VAR_c_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_CONST_SR_1_uxn_device_h_l150_c3_e3aa_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_right := VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_afa9_return_output;
     VAR_MUX_uxn_device_h_l147_c40_cd94_cond := VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_afa9_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l137_c2_3d33_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l137_c2_3d33_return_output;
     -- c_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_c_MUX_uxn_device_h_l137_c2_3d33_cond;
     c_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_c_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     c_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_c_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l137_c2_3d33_return_output := c_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- BIN_OP_OR[uxn_device_h_l146_c26_b96f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l146_c26_b96f_left <= VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_left;
     BIN_OP_OR_uxn_device_h_l146_c26_b96f_right <= VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output := BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output;

     -- MUX[uxn_device_h_l147_c40_cd94] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c40_cd94_cond <= VAR_MUX_uxn_device_h_l147_c40_cd94_cond;
     MUX_uxn_device_h_l147_c40_cd94_iftrue <= VAR_MUX_uxn_device_h_l147_c40_cd94_iftrue;
     MUX_uxn_device_h_l147_c40_cd94_iffalse <= VAR_MUX_uxn_device_h_l147_c40_cd94_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c40_cd94_return_output := MUX_uxn_device_h_l147_c40_cd94_return_output;

     -- Submodule level 8
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_BIN_OP_OR_uxn_device_h_l146_c26_b96f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_right := VAR_MUX_uxn_device_h_l147_c40_cd94_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l137_c2_3d33_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c30_980f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c30_980f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_left;
     BIN_OP_PLUS_uxn_device_h_l147_c30_980f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output := BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output;

     -- Submodule level 9
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_980f_return_output, 6);
     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l147_c21_2e40] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output;

     -- Submodule level 10
     VAR_result_u8_value_uxn_device_h_l147_c3_5064 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_2e40_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iffalse := VAR_result_u8_value_uxn_device_h_l147_c3_5064;
     -- result_u8_value_MUX[uxn_device_h_l137_c2_3d33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l137_c2_3d33_cond <= VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_cond;
     result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iftrue;
     result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output := result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l154_l103_DUPLICATE_686e LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l154_l103_DUPLICATE_686e_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_3d33_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_3d33_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_3d33_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_3d33_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l154_l103_DUPLICATE_686e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l154_l103_DUPLICATE_686e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_xmod <= REG_VAR_xmod;
REG_COMB_opaque <= REG_VAR_opaque;
REG_COMB_c <= REG_VAR_c;
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     xmod <= REG_COMB_xmod;
     opaque <= REG_COMB_opaque;
     c <= REG_COMB_c;
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
 end if;
 end if;
end process;

end arch;
