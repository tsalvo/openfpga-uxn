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
-- Submodules: 63
entity lda_0CLK_dc46ab2b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_dc46ab2b;
architecture arch of lda_0CLK_dc46ab2b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1322_c6_083d]
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1322_c1_00ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal t16_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1322_c2_07cf]
signal tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1323_c3_681f[uxn_opcodes_h_l1323_c3_681f]
signal printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1327_c11_a416]
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1327_c7_b9f9]
signal tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1330_c11_18f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1330_c7_6250]
signal t16_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1330_c7_6250]
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1330_c7_6250]
signal tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1332_c3_1fb9]
signal CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1334_c11_3529]
signal BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal t16_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1334_c7_aec4]
signal tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1335_c3_7431]
signal BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1337_c30_6d6f]
signal sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1340_c11_0112]
signal BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1340_c7_39ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1340_c7_39ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1340_c7_39ca]
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1340_c7_39ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1340_c7_39ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1340_c7_39ca]
signal tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1343_c11_2f3d]
signal BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1343_c7_f463]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1343_c7_f463]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1343_c7_f463]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1343_c7_f463]
signal result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1343_c7_f463]
signal tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1349_c11_c966]
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1349_c7_3c9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c7_3c9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ff87( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d
BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_left,
BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_right,
BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output);

-- t16_MUX_uxn_opcodes_h_l1322_c2_07cf
t16_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf
result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf
result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf
tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_cond,
tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

-- printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f
printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f : entity work.printf_uxn_opcodes_h_l1323_c3_681f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_left,
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_right,
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output);

-- t16_MUX_uxn_opcodes_h_l1327_c7_b9f9
t16_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9
result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9
tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond,
tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output);

-- t16_MUX_uxn_opcodes_h_l1330_c7_6250
t16_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
t16_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
t16_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250
result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1330_c7_6250
tmp8_MUX_uxn_opcodes_h_l1330_c7_6250 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_cond,
tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue,
tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse,
tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9
CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_x,
CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_left,
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_right,
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output);

-- t16_MUX_uxn_opcodes_h_l1334_c7_aec4
t16_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4
result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4
result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4
tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_cond,
tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431
BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_left,
BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_right,
BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f
sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_ins,
sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_x,
sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_y,
sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112
BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_left,
BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_right,
BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca
result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca
tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_cond,
tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue,
tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse,
tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_left,
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_right,
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463
result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_cond,
result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1343_c7_f463
tmp8_MUX_uxn_opcodes_h_l1343_c7_f463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_cond,
tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue,
tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse,
tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_left,
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_right,
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output,
 t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output,
 t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output,
 t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output,
 CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output,
 t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output,
 sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output,
 tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output,
 tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1324_c3_5714 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_b954 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_057d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1331_DUPLICATE_57e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1354_l1317_DUPLICATE_6d45_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_057d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_057d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_b954 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_b954;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1324_c3_5714 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1324_c3_5714;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c11_18f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1331_DUPLICATE_57e9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1331_DUPLICATE_57e9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1337_c30_6d6f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_ins;
     sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_x;
     sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output := sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1322_c6_083d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1340_c11_0112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_left;
     BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output := BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1349_c11_c966] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_left;
     BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output := BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1327_c11_a416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_left;
     BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output := BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1343_c11_2f3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1334_c11_3529] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_left;
     BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output := BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c6_083d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_a416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_18f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_3529_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c11_0112_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_2f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_c966_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1331_DUPLICATE_57e9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1331_DUPLICATE_57e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_f52d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1327_l1330_l1322_l1334_DUPLICATE_5758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1327_l1349_l1343_l1340_l1334_l1330_DUPLICATE_0ef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1327_l1340_l1330_l1322_DUPLICATE_9522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1327_l1322_l1349_l1340_l1334_l1330_DUPLICATE_9046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1340_l1330_l1343_l1334_DUPLICATE_8184_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1327_l1322_l1343_l1340_l1334_l1330_DUPLICATE_5dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1337_c30_6d6f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1335_c3_7431] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_left;
     BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output := BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1332_c3_1fb9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output := CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1349_c7_3c9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1340_c7_39ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1343_c7_f463] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_cond;
     tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output := tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1343_c7_f463] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output := result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1343_c7_f463] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c7_3c9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1322_c1_00ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_7431_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1332_c3_1fb9_return_output;
     VAR_printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1322_c1_00ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_3c9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1340_c7_39ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1343_c7_f463] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1343_c7_f463] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;

     -- t16_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- printf_uxn_opcodes_h_l1323_c3_681f[uxn_opcodes_h_l1323_c3_681f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1323_c3_681f_uxn_opcodes_h_l1323_c3_681f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1340_c7_39ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1340_c7_39ca] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_cond;
     tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output := tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f463_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1340_c7_39ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     t16_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     t16_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1340_c7_39ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c7_39ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     -- t16_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1334_c7_aec4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_aec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c7_6250] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_6250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1327_c7_b9f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_b9f9_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c2_07cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1354_l1317_DUPLICATE_6d45 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1354_l1317_DUPLICATE_6d45_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ff87(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1322_c2_07cf_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1354_l1317_DUPLICATE_6d45_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1354_l1317_DUPLICATE_6d45_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
