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
entity lth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_302e9520;
architecture arch of lth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_cd32]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_9e2b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c2_a676]
signal n16_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1832_c2_a676]
signal t16_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_a676]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_a676]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_a676]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_a676]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_a676]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_a676]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1833_c3_b494[uxn_opcodes_h_l1833_c3_b494]
signal printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_1262]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal n16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal t16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_4aee]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_c644]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal n16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal t16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_74ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_57aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_dfd0]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1846_c3_ee26]
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_535e]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal n16_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_6b70]
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_577c]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal n16_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_eec9]
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1854_c3_708d]
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1856_c30_d246]
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1859_c21_ab10]
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1859_c21_aaf2]
signal MUX_uxn_opcodes_h_l1859_c21_aaf2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_aaf2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_aaf2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_ffce]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_cb58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_cb58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_cb58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c2_a676
n16_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
n16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- t16_MUX_uxn_opcodes_h_l1832_c2_a676
t16_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
t16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
t16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

-- printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494
printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494 : entity work.printf_uxn_opcodes_h_l1833_c3_b494_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_4aee
n16_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- t16_MUX_uxn_opcodes_h_l1837_c7_4aee
t16_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output);

-- n16_MUX_uxn_opcodes_h_l1840_c7_74ee
n16_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- t16_MUX_uxn_opcodes_h_l1840_c7_74ee
t16_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c7_dfd0
n16_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c7_dfd0
t16_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26
BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_left,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_right,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output);

-- n16_MUX_uxn_opcodes_h_l1849_c7_6b70
n16_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_cond,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output);

-- n16_MUX_uxn_opcodes_h_l1853_c7_eec9
n16_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d
BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_left,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_right,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1856_c30_d246
sp_relative_shift_uxn_opcodes_h_l1856_c30_d246 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_ins,
sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_x,
sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_y,
sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10
BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_left,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_right,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output);

-- MUX_uxn_opcodes_h_l1859_c21_aaf2
MUX_uxn_opcodes_h_l1859_c21_aaf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1859_c21_aaf2_cond,
MUX_uxn_opcodes_h_l1859_c21_aaf2_iftrue,
MUX_uxn_opcodes_h_l1859_c21_aaf2_iffalse,
MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output,
 n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output,
 n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output,
 n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output,
 MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_31c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_8b6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_ccc8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_ddfb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_65c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1846_l1841_l1850_l1854_DUPLICATE_2b42_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_7f4f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1867_l1828_DUPLICATE_a849_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_ddfb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_ddfb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_8b6b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_8b6b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_65c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_65c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_31c8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_31c8;
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_ccc8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_ccc8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1856_c30_d246] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_ins;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_x;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output := sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_cd32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1846_l1841_l1850_l1854_DUPLICATE_2b42 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1846_l1841_l1850_l1854_DUPLICATE_2b42_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_57aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_ffce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_c644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_535e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_577c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_7f4f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_7f4f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_1262] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_cd32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_1262_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_c644_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_57aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_535e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_577c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ffce_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1846_l1841_l1850_l1854_DUPLICATE_2b42_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1846_l1841_l1850_l1854_DUPLICATE_2b42_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1846_l1841_l1850_l1854_DUPLICATE_2b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_c01a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_58ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_da53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_192d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_7f4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_7f4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_22c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_d246_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1854_c3_708d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_left;
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output := BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_cb58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_9e2b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_cb58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_cb58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1846_c3_ee26] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_left;
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output := BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_ee26_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_708d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1842_l1851_DUPLICATE_8ee9_return_output;
     VAR_printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_9e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_cb58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- printf_uxn_opcodes_h_l1833_c3_b494[uxn_opcodes_h_l1833_c3_b494] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1833_c3_b494_uxn_opcodes_h_l1833_c3_b494_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1859_c21_ab10] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_left;
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output := BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output;

     -- t16_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_ab10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- t16_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- MUX[uxn_opcodes_h_l1859_c21_aaf2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1859_c21_aaf2_cond <= VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_cond;
     MUX_uxn_opcodes_h_l1859_c21_aaf2_iftrue <= VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_iftrue;
     MUX_uxn_opcodes_h_l1859_c21_aaf2_iffalse <= VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output := MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue := VAR_MUX_uxn_opcodes_h_l1859_c21_aaf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_eec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_eec9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     t16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     t16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- n16_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_6b70] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output := result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_6b70_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_dfd0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_dfd0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_74ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     n16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_74ee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_4aee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_4aee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_a676] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1867_l1828_DUPLICATE_a849 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1867_l1828_DUPLICATE_a849_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_a676_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_a676_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1867_l1828_DUPLICATE_a849_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1867_l1828_DUPLICATE_a849_return_output;
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
