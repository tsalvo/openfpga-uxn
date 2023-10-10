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
-- Submodules: 64
entity eor_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_fd2391e7;
architecture arch of eor_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1196_c6_5119]
signal BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1196_c1_707b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1196_c2_126d]
signal result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1196_c2_126d]
signal t8_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1196_c2_126d]
signal n8_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1197_c3_4c1f[uxn_opcodes_h_l1197_c3_4c1f]
signal printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_babf]
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal t8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1202_c7_20a3]
signal n8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_655b]
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1205_c7_3a9d]
signal n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_3f6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1209_c7_c889]
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1209_c7_c889]
signal n8_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_7a04]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1212_c7_81f8]
signal n8_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1216_c32_7bf5]
signal BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1216_c32_e4c5]
signal BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1216_c32_7cd4]
signal MUX_uxn_opcodes_h_l1216_c32_7cd4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1216_c32_7cd4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1216_c32_7cd4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_48a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1218_c7_05f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_05f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_05f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_05f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_05f6]
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1222_c24_ee05]
signal BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1224_c11_de28]
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1224_c7_a18b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1224_c7_a18b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119
BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_left,
BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_right,
BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d
result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d
result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d
result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- t8_MUX_uxn_opcodes_h_l1196_c2_126d
t8_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
t8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
t8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- n8_MUX_uxn_opcodes_h_l1196_c2_126d
n8_MUX_uxn_opcodes_h_l1196_c2_126d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1196_c2_126d_cond,
n8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue,
n8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse,
n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

-- printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f
printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f : entity work.printf_uxn_opcodes_h_l1197_c3_4c1f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_left,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_right,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- t8_MUX_uxn_opcodes_h_l1202_c7_20a3
t8_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- n8_MUX_uxn_opcodes_h_l1202_c7_20a3
n8_MUX_uxn_opcodes_h_l1202_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond,
n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue,
n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse,
n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_left,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_right,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- t8_MUX_uxn_opcodes_h_l1205_c7_3a9d
t8_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- n8_MUX_uxn_opcodes_h_l1205_c7_3a9d
n8_MUX_uxn_opcodes_h_l1205_c7_3a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond,
n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue,
n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse,
n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- n8_MUX_uxn_opcodes_h_l1209_c7_c889
n8_MUX_uxn_opcodes_h_l1209_c7_c889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1209_c7_c889_cond,
n8_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue,
n8_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse,
n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- n8_MUX_uxn_opcodes_h_l1212_c7_81f8
n8_MUX_uxn_opcodes_h_l1212_c7_81f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1212_c7_81f8_cond,
n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue,
n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse,
n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5
BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_left,
BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_right,
BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5
BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_left,
BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_right,
BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output);

-- MUX_uxn_opcodes_h_l1216_c32_7cd4
MUX_uxn_opcodes_h_l1216_c32_7cd4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1216_c32_7cd4_cond,
MUX_uxn_opcodes_h_l1216_c32_7cd4_iftrue,
MUX_uxn_opcodes_h_l1216_c32_7cd4_iffalse,
MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05
BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_left,
BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_right,
BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_left,
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_right,
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output,
 MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_97a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_9eac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_b118 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1210_c3_d8bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_c3d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_57f8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1192_l1229_DUPLICATE_06d6_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_c3d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_c3d0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_b118 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_b118;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_97a2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_97a2;
     VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_9eac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_9eac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1210_c3_d8bf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1210_c3_d8bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := t8;
     -- BIN_OP_XOR[uxn_opcodes_h_l1222_c24_ee05] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_left;
     BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output := BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1216_c32_7bf5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_left;
     BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output := BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_655b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_babf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1196_c6_5119] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_left;
     BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output := BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_48a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1224_c11_de28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_3f6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_57f8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_57f8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_7a04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_7bf5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c6_5119_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_babf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_655b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_3f6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_7a04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_48a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_de28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1222_c24_ee05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_DUPLICATE_3f3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1224_l1218_DUPLICATE_35af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1205_l1202_l1196_l1218_DUPLICATE_ec00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1212_l1205_l1209_DUPLICATE_08e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1224_DUPLICATE_316d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_57f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_57f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1212_l1209_l1205_l1202_l1196_l1218_DUPLICATE_d3f5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_05f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1224_c7_a18b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_05f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1218_c7_05f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1196_c1_707b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1216_c32_e4c5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_left;
     BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output := BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1224_c7_a18b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_e4c5_return_output;
     VAR_printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1196_c1_707b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_a18b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     -- t8_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- MUX[uxn_opcodes_h_l1216_c32_7cd4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1216_c32_7cd4_cond <= VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_cond;
     MUX_uxn_opcodes_h_l1216_c32_7cd4_iftrue <= VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_iftrue;
     MUX_uxn_opcodes_h_l1216_c32_7cd4_iffalse <= VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output := MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_05f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- printf_uxn_opcodes_h_l1197_c3_4c1f[uxn_opcodes_h_l1197_c3_4c1f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1197_c3_4c1f_uxn_opcodes_h_l1197_c3_4c1f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     n8_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     n8_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_05f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue := VAR_MUX_uxn_opcodes_h_l1216_c32_7cd4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_05f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     -- n8_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- t8_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     t8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     t8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_81f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_81f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1209_c7_c889] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;

     -- n8_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_c889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_3a9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     n8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     n8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_3a9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_20a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_20a3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1196_c2_126d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1192_l1229_DUPLICATE_06d6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1192_l1229_DUPLICATE_06d6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c2_126d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1196_c2_126d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1192_l1229_DUPLICATE_06d6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1192_l1229_DUPLICATE_06d6_return_output;
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
