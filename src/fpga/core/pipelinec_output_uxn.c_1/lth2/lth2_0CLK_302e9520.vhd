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
-- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_232c]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_7094]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal t16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c2_32e2]
signal n16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1833_c3_fd8a[uxn_opcodes_h_l1833_c3_fd8a]
signal printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_ca99]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_dbd9]
signal n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_2a9a]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_e835]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_e835]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_e835]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_e835]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_e835]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_e835]
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1840_c7_e835]
signal t16_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1840_c7_e835]
signal n16_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_8e2b]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_7584]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_7584]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_7584]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_7584]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_7584]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_7584]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c7_7584]
signal t16_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c7_7584]
signal n16_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1846_c3_3397]
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_8a66]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_012d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_012d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_012d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_012d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_012d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_012d]
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1849_c7_012d]
signal n16_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_921a]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1853_c7_68b4]
signal n16_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1854_c3_0a3f]
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1856_c30_1246]
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1859_c21_b9fa]
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1859_c21_f309]
signal MUX_uxn_opcodes_h_l1859_c21_f309_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_f309_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_f309_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_f309_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_3f1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_b791]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_b791]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_b791]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- t16_MUX_uxn_opcodes_h_l1832_c2_32e2
t16_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c2_32e2
n16_MUX_uxn_opcodes_h_l1832_c2_32e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond,
n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

-- printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a
printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a : entity work.printf_uxn_opcodes_h_l1833_c3_fd8a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- t16_MUX_uxn_opcodes_h_l1837_c7_dbd9
t16_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_dbd9
n16_MUX_uxn_opcodes_h_l1837_c7_dbd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- t16_MUX_uxn_opcodes_h_l1840_c7_e835
t16_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
t16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
t16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- n16_MUX_uxn_opcodes_h_l1840_c7_e835
n16_MUX_uxn_opcodes_h_l1840_c7_e835 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1840_c7_e835_cond,
n16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue,
n16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse,
n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c7_7584
t16_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
t16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c7_7584
n16_MUX_uxn_opcodes_h_l1845_c7_7584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c7_7584_cond,
n16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397
BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_left,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_right,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- n16_MUX_uxn_opcodes_h_l1849_c7_012d
n16_MUX_uxn_opcodes_h_l1849_c7_012d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1849_c7_012d_cond,
n16_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue,
n16_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse,
n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1853_c7_68b4
n16_MUX_uxn_opcodes_h_l1853_c7_68b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1853_c7_68b4_cond,
n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue,
n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse,
n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f
BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_left,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_right,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1856_c30_1246
sp_relative_shift_uxn_opcodes_h_l1856_c30_1246 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_ins,
sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_x,
sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_y,
sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa
BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_left,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_right,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output);

-- MUX_uxn_opcodes_h_l1859_c21_f309
MUX_uxn_opcodes_h_l1859_c21_f309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1859_c21_f309_cond,
MUX_uxn_opcodes_h_l1859_c21_f309_iftrue,
MUX_uxn_opcodes_h_l1859_c21_f309_iffalse,
MUX_uxn_opcodes_h_l1859_c21_f309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee
CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output,
 MUX_uxn_opcodes_h_l1859_c21_f309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_9776 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_2b9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_9d84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_b957 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_ed77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_f309_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_f309_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_f309_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_f309_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1846_l1850_l1854_DUPLICATE_f56d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_29bb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1828_l1867_DUPLICATE_51a2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_b957 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_b957;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_9776 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_9776;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_9d84 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_9d84;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_ed77 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_ed77;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_2b9f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_2b9f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1859_c21_f309_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1859_c21_f309_iffalse := resize(to_unsigned(0, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_3f1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_8a66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1846_l1850_l1854_DUPLICATE_f56d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1846_l1850_l1854_DUPLICATE_f56d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_29bb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_29bb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_8e2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_ca99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1856_c30_1246] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_ins;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_x;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output := sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_232c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_2a9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_921a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_232c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_ca99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2a9a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_8e2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_8a66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_921a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_3f1b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1846_l1850_l1854_DUPLICATE_f56d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1846_l1850_l1854_DUPLICATE_f56d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1846_l1850_l1854_DUPLICATE_f56d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_7da3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1853_l1849_l1845_l1840_l1837_DUPLICATE_e04f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_cfaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1832_l1861_l1849_l1845_l1840_l1837_DUPLICATE_5861_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_29bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1849_l1853_DUPLICATE_29bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1832_l1853_l1849_l1845_l1840_l1837_DUPLICATE_814d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_1246_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1854_c3_0a3f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_left;
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output := BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_b791] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_b791] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_b791] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_7094] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1846_c3_3397] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_left;
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output := BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_3397_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_0a3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_34ee_return_output;
     VAR_printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_7094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_b791_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_b791_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_b791_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- printf_uxn_opcodes_h_l1833_c3_fd8a[uxn_opcodes_h_l1833_c3_fd8a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1833_c3_fd8a_uxn_opcodes_h_l1833_c3_fd8a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     t16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1859_c21_b9fa] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_left;
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output := BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1859_c21_f309_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_b9fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- MUX[uxn_opcodes_h_l1859_c21_f309] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1859_c21_f309_cond <= VAR_MUX_uxn_opcodes_h_l1859_c21_f309_cond;
     MUX_uxn_opcodes_h_l1859_c21_f309_iftrue <= VAR_MUX_uxn_opcodes_h_l1859_c21_f309_iftrue;
     MUX_uxn_opcodes_h_l1859_c21_f309_iffalse <= VAR_MUX_uxn_opcodes_h_l1859_c21_f309_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1859_c21_f309_return_output := MUX_uxn_opcodes_h_l1859_c21_f309_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     n16_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     n16_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     t16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     t16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue := VAR_MUX_uxn_opcodes_h_l1859_c21_f309_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- n16_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     n16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- t16_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_68b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_68b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     -- t16_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_012d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     n16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     n16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_012d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_7584] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_7584_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_e835] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output := result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_e835_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_dbd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_dbd9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_32e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1828_l1867_DUPLICATE_51a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1828_l1867_DUPLICATE_51a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_32e2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1828_l1867_DUPLICATE_51a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1828_l1867_DUPLICATE_51a2_return_output;
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
