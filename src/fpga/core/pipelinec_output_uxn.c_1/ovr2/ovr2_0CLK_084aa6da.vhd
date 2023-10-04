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
-- Submodules: 136
entity ovr2_0CLK_084aa6da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_084aa6da;
architecture arch of ovr2_0CLK_084aa6da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l378_c6_f5d6]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l378_c1_4727]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l378_c2_f79b]
signal t16_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l378_c2_f79b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l378_c2_f79b]
signal n16_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l379_c3_fdd6[uxn_opcodes_h_l379_c3_fdd6]
signal printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_ae1b]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal t16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l384_c7_c0b3]
signal n16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l387_c11_3cd6]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l387_c7_0529]
signal t16_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l387_c7_0529]
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l387_c7_0529]
signal n16_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l392_c11_cb79]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l392_c7_d44a]
signal t16_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l392_c7_d44a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l392_c7_d44a]
signal n16_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l395_c11_c908]
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l395_c7_8605]
signal t16_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_8605]
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l395_c7_8605]
signal n16_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l396_c3_94f0]
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l399_c11_4dfb]
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_1383]
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l399_c7_1383]
signal n16_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l402_c11_dbc6]
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l402_c7_8f48]
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l402_c7_8f48]
signal n16_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l407_c11_16fe]
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l407_c7_b078]
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l407_c7_b078]
signal n16_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l410_c11_4cb3]
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l410_c7_e040]
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l410_c7_e040]
signal n16_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l411_c3_50c1]
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l414_c32_d84a]
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l414_c32_9f4c]
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l414_c32_ba76]
signal MUX_uxn_opcodes_h_l414_c32_ba76_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_ba76_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_ba76_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_ba76_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l416_c11_6c61]
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_99c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l416_c7_99c4]
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_99c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_99c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_99c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l422_c11_54c9]
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c7_0c37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l422_c7_0c37]
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l422_c7_0c37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l422_c7_0c37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l426_c11_fac8]
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l426_c7_1cd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l426_c7_1cd4]
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l426_c7_1cd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l426_c7_1cd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_b647]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_0748]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l430_c7_0748]
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_0748]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_0748]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l432_c34_f075]
signal CONST_SR_8_uxn_opcodes_h_l432_c34_f075_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l434_c11_b4a4]
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l434_c7_cecb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l434_c7_cecb]
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l434_c7_cecb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l434_c7_cecb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l438_c11_a1ec]
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_0ffb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l438_c7_0ffb]
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_0ffb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_0ffb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l442_c11_6c88]
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l442_c7_efdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l442_c7_efdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output);

-- t16_MUX_uxn_opcodes_h_l378_c2_f79b
t16_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
t16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
t16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b
result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- n16_MUX_uxn_opcodes_h_l378_c2_f79b
n16_MUX_uxn_opcodes_h_l378_c2_f79b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l378_c2_f79b_cond,
n16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue,
n16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse,
n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

-- printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6
printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6 : entity work.printf_uxn_opcodes_h_l379_c3_fdd6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output);

-- t16_MUX_uxn_opcodes_h_l384_c7_c0b3
t16_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3
result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- n16_MUX_uxn_opcodes_h_l384_c7_c0b3
n16_MUX_uxn_opcodes_h_l384_c7_c0b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond,
n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue,
n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse,
n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6
BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output);

-- t16_MUX_uxn_opcodes_h_l387_c7_0529
t16_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l387_c7_0529_cond,
t16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
t16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529
result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- n16_MUX_uxn_opcodes_h_l387_c7_0529
n16_MUX_uxn_opcodes_h_l387_c7_0529 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l387_c7_0529_cond,
n16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue,
n16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse,
n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79
BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output);

-- t16_MUX_uxn_opcodes_h_l392_c7_d44a
t16_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
t16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
t16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a
result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- n16_MUX_uxn_opcodes_h_l392_c7_d44a
n16_MUX_uxn_opcodes_h_l392_c7_d44a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l392_c7_d44a_cond,
n16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue,
n16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse,
n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908
BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_left,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_right,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output);

-- t16_MUX_uxn_opcodes_h_l395_c7_8605
t16_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l395_c7_8605_cond,
t16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
t16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605
result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- n16_MUX_uxn_opcodes_h_l395_c7_8605
n16_MUX_uxn_opcodes_h_l395_c7_8605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l395_c7_8605_cond,
n16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue,
n16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse,
n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0
BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_left,
BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_right,
BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_left,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_right,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383
result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- n16_MUX_uxn_opcodes_h_l399_c7_1383
n16_MUX_uxn_opcodes_h_l399_c7_1383 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l399_c7_1383_cond,
n16_MUX_uxn_opcodes_h_l399_c7_1383_iftrue,
n16_MUX_uxn_opcodes_h_l399_c7_1383_iffalse,
n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6
BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_left,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_right,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- n16_MUX_uxn_opcodes_h_l402_c7_8f48
n16_MUX_uxn_opcodes_h_l402_c7_8f48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l402_c7_8f48_cond,
n16_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue,
n16_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse,
n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe
BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_left,
BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_right,
BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078
result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- n16_MUX_uxn_opcodes_h_l407_c7_b078
n16_MUX_uxn_opcodes_h_l407_c7_b078 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l407_c7_b078_cond,
n16_MUX_uxn_opcodes_h_l407_c7_b078_iftrue,
n16_MUX_uxn_opcodes_h_l407_c7_b078_iffalse,
n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3
BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_left,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_right,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040
result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- n16_MUX_uxn_opcodes_h_l410_c7_e040
n16_MUX_uxn_opcodes_h_l410_c7_e040 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l410_c7_e040_cond,
n16_MUX_uxn_opcodes_h_l410_c7_e040_iftrue,
n16_MUX_uxn_opcodes_h_l410_c7_e040_iffalse,
n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1
BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_left,
BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_right,
BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a
BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_left,
BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_right,
BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c
BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_left,
BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_right,
BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output);

-- MUX_uxn_opcodes_h_l414_c32_ba76
MUX_uxn_opcodes_h_l414_c32_ba76 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l414_c32_ba76_cond,
MUX_uxn_opcodes_h_l414_c32_ba76_iftrue,
MUX_uxn_opcodes_h_l414_c32_ba76_iffalse,
MUX_uxn_opcodes_h_l414_c32_ba76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61
BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_left,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_right,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4
result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9
BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_left,
BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_right,
BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37
result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_cond,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8
BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_left,
BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_right,
BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_cond,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647
BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748
result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_cond,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output);

-- CONST_SR_8_uxn_opcodes_h_l432_c34_f075
CONST_SR_8_uxn_opcodes_h_l432_c34_f075 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l432_c34_f075_x,
CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4
BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_left,
BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_right,
BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb
result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_cond,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec
BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_left,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_right,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb
result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_cond,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_left,
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_right,
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea
CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output,
 t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output,
 t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output,
 t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output,
 t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output,
 t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output,
 BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output,
 BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output,
 MUX_uxn_opcodes_h_l414_c32_ba76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output,
 CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_5447 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_52d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_98f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_721a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_534a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_7df7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_be84 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_eb34 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_ba76_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_ba76_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_ba76_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_ba76_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_e910 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_1fd8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_694a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_de86_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_6560 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_f075_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_f9bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_91a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_a238 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l403_l388_l411_DUPLICATE_873a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_a8ac_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_c12c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_5f2a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l447_l374_DUPLICATE_c220_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_7df7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_7df7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_98f8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_98f8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_52d2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_52d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_721a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_721a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_91a1 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_91a1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_e910 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_e910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_right := to_unsigned(12, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l414_c32_ba76_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_eb34 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_eb34;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_694a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_694a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_6560 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_6560;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l414_c32_ba76_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_a238 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_a238;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_be84 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_be84;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_1fd8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_1fd8;
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_5447 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_5447;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_534a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_534a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_right := to_unsigned(14, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_f075_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l438_c11_a1ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c11_cb79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l399_c11_4dfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l416_c11_6c61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_left;
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output := BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_c12c LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_c12c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l434_c11_b4a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c11_3cd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l407_c11_16fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l422_c11_54c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_ae1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l395_c11_c908] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_left;
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output := BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c6_f5d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l414_c32_d84a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_left;
     BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output := BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l442_c11_6c88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_left;
     BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output := BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l428_c24_de86] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_de86_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l403_l388_l411_DUPLICATE_873a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l403_l388_l411_DUPLICATE_873a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l402_c11_dbc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_b647] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_a8ac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_a8ac_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l410_c11_4cb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l432_c34_f075] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l432_c34_f075_x <= VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_f075_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output := CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l426_c11_fac8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_left;
     BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output := BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_d84a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f5d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ae1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_3cd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_cb79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_c908_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4dfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_dbc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_16fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_4cb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_6c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_54c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_fac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_b647_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_b4a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_a1ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6c88_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l403_l388_l411_DUPLICATE_873a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l403_l388_l411_DUPLICATE_873a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l403_l388_l411_DUPLICATE_873a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_de86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_c12c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_c12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_45cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l407_l434_l402_l430_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_DUPLICATE_cc85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l416_l387_l384_DUPLICATE_fc99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l407_l402_l399_l395_l392_l387_l410_l384_DUPLICATE_0320_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l407_l434_l378_l402_l430_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_DUPLICATE_f472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_a8ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_a8ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l407_l378_l402_l399_l395_l392_l387_l410_l438_l384_DUPLICATE_43f4_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l411_c3_50c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_left;
     BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output := BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_5f2a LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_5f2a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_569e_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l378_c1_4727] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l442_c7_efdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_0ffb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l442_c7_efdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_99c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l396_c3_94f0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_left;
     BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output := BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l432_c24_f9bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_f9bb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_f075_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l414_c32_9f4c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_left;
     BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output := BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l414_c32_ba76_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_9f4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_94f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_50c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_f9bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_5f2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_5f2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_00ea_return_output;
     VAR_printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_4727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_efdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_efdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l434_c7_cecb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l438_c7_0ffb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output := result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;

     -- MUX[uxn_opcodes_h_l414_c32_ba76] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l414_c32_ba76_cond <= VAR_MUX_uxn_opcodes_h_l414_c32_ba76_cond;
     MUX_uxn_opcodes_h_l414_c32_ba76_iftrue <= VAR_MUX_uxn_opcodes_h_l414_c32_ba76_iftrue;
     MUX_uxn_opcodes_h_l414_c32_ba76_iffalse <= VAR_MUX_uxn_opcodes_h_l414_c32_ba76_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l414_c32_ba76_return_output := MUX_uxn_opcodes_h_l414_c32_ba76_return_output;

     -- t16_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     t16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     t16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output := t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_0ffb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;

     -- printf_uxn_opcodes_h_l379_c3_fdd6[uxn_opcodes_h_l379_c3_fdd6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l379_c3_fdd6_uxn_opcodes_h_l379_c3_fdd6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_0ffb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;

     -- n16_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     n16_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     n16_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output := n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue := VAR_MUX_uxn_opcodes_h_l414_c32_ba76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_n16_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_0ffb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l434_c7_cecb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output := result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l434_c7_cecb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- t16_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     t16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     t16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- n16_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     n16_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     n16_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output := n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_0748] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l434_c7_cecb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_n16_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_0748_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_cecb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_t16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l426_c7_1cd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_0748] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output;

     -- t16_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     t16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     t16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output := t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- n16_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     n16_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     n16_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_0748] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l430_c7_0748] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_cond;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output := result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_n16_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_0748_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_0748_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_0748_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l426_c7_1cd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l426_c7_1cd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c7_0c37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;

     -- n16_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     n16_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     n16_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output := n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- t16_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l426_c7_1cd4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output := result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_n16_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1cd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l422_c7_0c37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_99c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l422_c7_0c37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;

     -- n16_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     n16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     n16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output := n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l422_c7_0c37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output := result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;

     -- t16_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     t16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     t16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_0c37_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l416_c7_99c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_99c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_99c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     n16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     n16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_n16_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_99c4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- n16_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     n16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     n16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output := n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l410_c7_e040] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_cond;
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output := result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_e040_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l407_c7_b078] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_cond;
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output := result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- n16_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_b078_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l402_c7_8f48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output := result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;

     -- n16_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     n16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     n16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8f48_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l399_c7_1383] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_cond;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output := result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_1383_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_8605] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_8605_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l392_c7_d44a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output := result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_d44a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l387_c7_0529] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_cond;
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output := result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_0529_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_c0b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_c0b3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l378_c2_f79b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output := result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l447_l374_DUPLICATE_c220 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l447_l374_DUPLICATE_c220_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_f79b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_f79b_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l447_l374_DUPLICATE_c220_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l447_l374_DUPLICATE_c220_return_output;
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
