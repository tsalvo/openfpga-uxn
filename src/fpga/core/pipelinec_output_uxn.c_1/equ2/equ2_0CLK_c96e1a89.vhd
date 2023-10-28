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
-- Submodules: 91
entity equ2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_c96e1a89;
architecture arch of equ2_0CLK_c96e1a89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1267_c6_1de4]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1267_c1_0060]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1267_c2_f168]
signal t16_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c2_f168]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c2_f168]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c2_f168]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c2_f168]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c2_f168]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c2_f168]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1267_c2_f168]
signal n16_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1268_c3_2483[uxn_opcodes_h_l1268_c3_2483]
signal printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1272_c11_9948]
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal t16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1272_c7_05e9]
signal n16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_e8a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal t16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1275_c7_71c8]
signal n16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1280_c11_c23d]
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1280_c7_220f]
signal t16_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1280_c7_220f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1280_c7_220f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1280_c7_220f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1280_c7_220f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1280_c7_220f]
signal result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1280_c7_220f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1280_c7_220f]
signal n16_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1283_c11_43ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal t16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1283_c7_5a50]
signal n16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1284_c3_346b]
signal BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_78f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1287_c7_e80e]
signal n16_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_f2be]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_e211]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_e211]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_e211]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_e211]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_e211]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_e211]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_e211]
signal n16_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1295_c11_b2de]
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1295_c7_c60c]
signal n16_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_29a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_6ebe]
signal n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_0e8f]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1301_c30_490e]
signal sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1304_c21_5a35]
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1304_c21_f60b]
signal MUX_uxn_opcodes_h_l1304_c21_f60b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1304_c21_f60b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1304_c21_f60b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1304_c21_f60b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_5a5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_9d6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_9d6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_9d6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4
BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output);

-- t16_MUX_uxn_opcodes_h_l1267_c2_f168
t16_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
t16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
t16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168
result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- n16_MUX_uxn_opcodes_h_l1267_c2_f168
n16_MUX_uxn_opcodes_h_l1267_c2_f168 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1267_c2_f168_cond,
n16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue,
n16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse,
n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

-- printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483
printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483 : entity work.printf_uxn_opcodes_h_l1268_c3_2483_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_left,
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_right,
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output);

-- t16_MUX_uxn_opcodes_h_l1272_c7_05e9
t16_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9
result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- n16_MUX_uxn_opcodes_h_l1272_c7_05e9
n16_MUX_uxn_opcodes_h_l1272_c7_05e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond,
n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue,
n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse,
n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output);

-- t16_MUX_uxn_opcodes_h_l1275_c7_71c8
t16_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- n16_MUX_uxn_opcodes_h_l1275_c7_71c8
n16_MUX_uxn_opcodes_h_l1275_c7_71c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond,
n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue,
n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse,
n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_left,
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_right,
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output);

-- t16_MUX_uxn_opcodes_h_l1280_c7_220f
t16_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
t16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
t16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f
result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- n16_MUX_uxn_opcodes_h_l1280_c7_220f
n16_MUX_uxn_opcodes_h_l1280_c7_220f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1280_c7_220f_cond,
n16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue,
n16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse,
n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output);

-- t16_MUX_uxn_opcodes_h_l1283_c7_5a50
t16_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50
result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- n16_MUX_uxn_opcodes_h_l1283_c7_5a50
n16_MUX_uxn_opcodes_h_l1283_c7_5a50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond,
n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue,
n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse,
n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b
BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_left,
BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_right,
BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e
result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- n16_MUX_uxn_opcodes_h_l1287_c7_e80e
n16_MUX_uxn_opcodes_h_l1287_c7_e80e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1287_c7_e80e_cond,
n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue,
n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse,
n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_e211
n16_MUX_uxn_opcodes_h_l1290_c7_e211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_e211_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_left,
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_right,
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c
result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- n16_MUX_uxn_opcodes_h_l1295_c7_c60c
n16_MUX_uxn_opcodes_h_l1295_c7_c60c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1295_c7_c60c_cond,
n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue,
n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse,
n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_6ebe
n16_MUX_uxn_opcodes_h_l1298_c7_6ebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f
BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1301_c30_490e
sp_relative_shift_uxn_opcodes_h_l1301_c30_490e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_ins,
sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_x,
sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_y,
sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35
BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_left,
BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_right,
BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output);

-- MUX_uxn_opcodes_h_l1304_c21_f60b
MUX_uxn_opcodes_h_l1304_c21_f60b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1304_c21_f60b_cond,
MUX_uxn_opcodes_h_l1304_c21_f60b_iftrue,
MUX_uxn_opcodes_h_l1304_c21_f60b_iffalse,
MUX_uxn_opcodes_h_l1304_c21_f60b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output,
 t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output,
 t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output,
 t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output,
 t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output,
 t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output,
 MUX_uxn_opcodes_h_l1304_c21_f60b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_5e8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_d1e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_5971 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1281_c3_c338 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_f37a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_2376 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_d7ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_2586 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1303_c3_1872 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1298_c7_6ebe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1276_l1284_l1291_l1299_DUPLICATE_5f90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1263_l1312_DUPLICATE_e293_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1303_c3_1872 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1303_c3_1872;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_f37a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_f37a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_d7ff := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_d7ff;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1281_c3_c338 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1281_c3_c338;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_5971 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_5971;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_2376 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_2376;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_5e8b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_5e8b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_d1e2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_d1e2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_2586 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_2586;
     VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1283_c11_43ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_e8a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1295_c11_b2de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_29a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1276_l1284_l1291_l1299_DUPLICATE_5f90 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1276_l1284_l1291_l1299_DUPLICATE_5f90_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1280_c11_c23d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1272_c11_9948] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_left;
     BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output := BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c6_1de4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1298_c7_6ebe_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1301_c30_490e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_ins;
     sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_x;
     sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output := sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_5a5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_78f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_f2be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c6_1de4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_9948_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_e8a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_c23d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_43ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_78f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f2be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_b2de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_29a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_5a5b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1276_l1284_l1291_l1299_DUPLICATE_5f90_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1276_l1284_l1291_l1299_DUPLICATE_5f90_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1276_l1284_l1291_l1299_DUPLICATE_5f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_f4bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1298_l1283_l1290_DUPLICATE_b56a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_8cdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1306_l1272_l1267_l1283_l1290_DUPLICATE_431e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1287_l1280_l1295_l1275_l1272_l1298_l1267_l1283_l1290_DUPLICATE_ebd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1301_c30_490e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_9d6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1267_c1_0060] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_0e8f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_9d6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_9d6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1284_c3_346b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_left;
     BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output := BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1284_c3_346b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_0e8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1292_l1277_DUPLICATE_c8f9_return_output;
     VAR_printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1267_c1_0060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_9d6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1304_c21_5a35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_left;
     BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output := BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- printf_uxn_opcodes_h_l1268_c3_2483[uxn_opcodes_h_l1268_c3_2483] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1268_c3_2483_uxn_opcodes_h_l1268_c3_2483_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c21_5a35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     t16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     t16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- MUX[uxn_opcodes_h_l1304_c21_f60b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1304_c21_f60b_cond <= VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_cond;
     MUX_uxn_opcodes_h_l1304_c21_f60b_iftrue <= VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_iftrue;
     MUX_uxn_opcodes_h_l1304_c21_f60b_iffalse <= VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_return_output := MUX_uxn_opcodes_h_l1304_c21_f60b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue := VAR_MUX_uxn_opcodes_h_l1304_c21_f60b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_6ebe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_6ebe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1295_c7_c60c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c7_c60c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- n16_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- t16_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     t16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     t16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_e211] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_e211_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1287_c7_e80e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     n16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     n16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1287_c7_e80e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1283_c7_5a50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output := result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1283_c7_5a50_return_output;
     -- n16_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1280_c7_220f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1280_c7_220f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- n16_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     n16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     n16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_71c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_71c8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1272_c7_05e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1272_c7_05e9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c2_f168] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1263_l1312_DUPLICATE_e293 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1263_l1312_DUPLICATE_e293_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c2_f168_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c2_f168_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1263_l1312_DUPLICATE_e293_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1263_l1312_DUPLICATE_e293_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
