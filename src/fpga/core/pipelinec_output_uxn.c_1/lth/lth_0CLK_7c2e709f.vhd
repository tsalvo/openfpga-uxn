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
-- Submodules: 65
entity lth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_7c2e709f;
architecture arch of lth_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1572_c6_fd53]
signal BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1572_c1_90c4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1572_c2_544c]
signal t8_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1572_c2_544c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1572_c2_544c]
signal n8_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1573_c3_0a19[uxn_opcodes_h_l1573_c3_0a19]
signal printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_30df]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal t8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1578_c7_65c2]
signal n8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_a5e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1581_c7_8268]
signal t8_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1581_c7_8268]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1581_c7_8268]
signal n8_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_7a6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1585_c7_0a96]
signal n8_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_c719]
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1588_c7_0832]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1588_c7_0832]
signal n8_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1592_c32_28fb]
signal BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1592_c32_0f6b]
signal BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1592_c32_8784]
signal MUX_uxn_opcodes_h_l1592_c32_8784_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1592_c32_8784_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1592_c32_8784_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1592_c32_8784_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_6e92]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c7_57e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1594_c7_57e8]
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_57e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c7_57e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c7_57e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1598_c24_d98d]
signal BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1598_c24_67fa]
signal MUX_uxn_opcodes_h_l1598_c24_67fa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1598_c24_67fa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1598_c24_67fa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1598_c24_67fa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1600_c11_daec]
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1600_c7_0daa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1600_c7_0daa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53
BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_left,
BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_right,
BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output);

-- t8_MUX_uxn_opcodes_h_l1572_c2_544c
t8_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
t8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
t8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c
result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c
result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- n8_MUX_uxn_opcodes_h_l1572_c2_544c
n8_MUX_uxn_opcodes_h_l1572_c2_544c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1572_c2_544c_cond,
n8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue,
n8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse,
n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

-- printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19
printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19 : entity work.printf_uxn_opcodes_h_l1573_c3_0a19_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output);

-- t8_MUX_uxn_opcodes_h_l1578_c7_65c2
t8_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- n8_MUX_uxn_opcodes_h_l1578_c7_65c2
n8_MUX_uxn_opcodes_h_l1578_c7_65c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond,
n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue,
n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse,
n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output);

-- t8_MUX_uxn_opcodes_h_l1581_c7_8268
t8_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
t8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
t8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268
result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- n8_MUX_uxn_opcodes_h_l1581_c7_8268
n8_MUX_uxn_opcodes_h_l1581_c7_8268 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1581_c7_8268_cond,
n8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue,
n8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse,
n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96
result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96
result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96
result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96
result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- n8_MUX_uxn_opcodes_h_l1585_c7_0a96
n8_MUX_uxn_opcodes_h_l1585_c7_0a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1585_c7_0a96_cond,
n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue,
n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse,
n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_left,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_right,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832
result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832
result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832
result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- n8_MUX_uxn_opcodes_h_l1588_c7_0832
n8_MUX_uxn_opcodes_h_l1588_c7_0832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1588_c7_0832_cond,
n8_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue,
n8_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse,
n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb
BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_left,
BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_right,
BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b
BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_left,
BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_right,
BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output);

-- MUX_uxn_opcodes_h_l1592_c32_8784
MUX_uxn_opcodes_h_l1592_c32_8784 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1592_c32_8784_cond,
MUX_uxn_opcodes_h_l1592_c32_8784_iftrue,
MUX_uxn_opcodes_h_l1592_c32_8784_iffalse,
MUX_uxn_opcodes_h_l1592_c32_8784_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8
result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d
BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_left,
BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_right,
BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output);

-- MUX_uxn_opcodes_h_l1598_c24_67fa
MUX_uxn_opcodes_h_l1598_c24_67fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1598_c24_67fa_cond,
MUX_uxn_opcodes_h_l1598_c24_67fa_iftrue,
MUX_uxn_opcodes_h_l1598_c24_67fa_iffalse,
MUX_uxn_opcodes_h_l1598_c24_67fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_left,
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_right,
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa
result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output,
 t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output,
 t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output,
 t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output,
 MUX_uxn_opcodes_h_l1592_c32_8784_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output,
 MUX_uxn_opcodes_h_l1598_c24_67fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_dd91 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1579_c3_f3bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1583_c3_4470 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1586_c3_d6e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1592_c32_8784_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1592_c32_8784_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1592_c32_8784_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1592_c32_8784_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1597_c3_92ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1594_DUPLICATE_5e2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1605_l1568_DUPLICATE_02ba_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_dd91 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_dd91;
     VAR_MUX_uxn_opcodes_h_l1592_c32_8784_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1597_c3_92ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1597_c3_92ca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1579_c3_f3bc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1579_c3_f3bc;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1586_c3_d6e7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1586_c3_d6e7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1592_c32_8784_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1583_c3_4470 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1583_c3_4470;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_6e92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1600_c11_daec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_a5e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_c719] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_left;
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output := BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71_return_output := result.is_stack_read;

     -- BIN_OP_LT[uxn_opcodes_h_l1598_c24_d98d] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_left;
     BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output := BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1592_c32_28fb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_left;
     BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output := BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1572_c6_fd53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_left;
     BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output := BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_7a6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1594_DUPLICATE_5e2e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1594_DUPLICATE_5e2e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_30df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1592_c32_28fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c6_fd53_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_30df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_a5e7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_7a6c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_c719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_6e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_daec_return_output;
     VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1598_c24_d98d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1588_DUPLICATE_8e67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1600_l1594_l1588_DUPLICATE_2aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_DUPLICATE_2bfd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1585_l1578_l1588_l1581_DUPLICATE_8f71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1600_l1588_DUPLICATE_94c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1594_DUPLICATE_5e2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1594_DUPLICATE_5e2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1585_l1581_l1578_l1572_l1594_l1588_DUPLICATE_606a_return_output;
     -- t8_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     t8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     t8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- n8_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     n8_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     n8_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1600_c7_0daa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c7_57e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;

     -- MUX[uxn_opcodes_h_l1598_c24_67fa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1598_c24_67fa_cond <= VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_cond;
     MUX_uxn_opcodes_h_l1598_c24_67fa_iftrue <= VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_iftrue;
     MUX_uxn_opcodes_h_l1598_c24_67fa_iffalse <= VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_return_output := MUX_uxn_opcodes_h_l1598_c24_67fa_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1592_c32_0f6b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_left;
     BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output := BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1572_c1_90c4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c7_57e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1600_c7_0daa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1592_c32_8784_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1592_c32_0f6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue := VAR_MUX_uxn_opcodes_h_l1598_c24_67fa_return_output;
     VAR_printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1572_c1_90c4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1600_c7_0daa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- n8_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- printf_uxn_opcodes_h_l1573_c3_0a19[uxn_opcodes_h_l1573_c3_0a19] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1573_c3_0a19_uxn_opcodes_h_l1573_c3_0a19_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c7_57e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- MUX[uxn_opcodes_h_l1592_c32_8784] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1592_c32_8784_cond <= VAR_MUX_uxn_opcodes_h_l1592_c32_8784_cond;
     MUX_uxn_opcodes_h_l1592_c32_8784_iftrue <= VAR_MUX_uxn_opcodes_h_l1592_c32_8784_iftrue;
     MUX_uxn_opcodes_h_l1592_c32_8784_iffalse <= VAR_MUX_uxn_opcodes_h_l1592_c32_8784_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1592_c32_8784_return_output := MUX_uxn_opcodes_h_l1592_c32_8784_return_output;

     -- t8_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_57e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1594_c7_57e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue := VAR_MUX_uxn_opcodes_h_l1592_c32_8784_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c7_57e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- t8_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     t8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     t8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- n8_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     n8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     n8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1588_c7_0832] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1588_c7_0832_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_0a96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;

     -- n8_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1585_c7_0a96_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     n8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     n8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1581_c7_8268] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output := result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c7_8268_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_65c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_65c2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1572_c2_544c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1605_l1568_DUPLICATE_02ba LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1605_l1568_DUPLICATE_02ba_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c2_544c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1572_c2_544c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1605_l1568_DUPLICATE_02ba_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1605_l1568_DUPLICATE_02ba_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
