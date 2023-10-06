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
-- BIN_OP_EQ[uxn_opcodes_h_l378_c6_f797]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l378_c1_1e94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal n16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal t16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l378_c2_e4f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l379_c3_0653[uxn_opcodes_h_l379_c3_0653]
signal printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_e21a]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l384_c7_64d0]
signal n16_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l384_c7_64d0]
signal t16_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_64d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l387_c11_372f]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal n16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal t16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l387_c7_6c9a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l392_c11_7851]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l392_c7_02fe]
signal n16_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l392_c7_02fe]
signal t16_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l392_c7_02fe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l395_c11_6bbb]
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l395_c7_4c43]
signal n16_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l395_c7_4c43]
signal t16_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_4c43]
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l396_c3_68b4]
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l399_c11_0e15]
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal n16_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_bb5f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l402_c11_e506]
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal n16_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l402_c7_0d6a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l407_c11_4f29]
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l407_c7_4d27]
signal n16_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l407_c7_4d27]
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l410_c11_48c3]
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l410_c7_858b]
signal n16_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l410_c7_858b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l411_c3_0515]
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l414_c32_0b13]
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l414_c32_3d9f]
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l414_c32_823d]
signal MUX_uxn_opcodes_h_l414_c32_823d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_823d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_823d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_823d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l416_c11_ffaf]
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_7e7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l416_c7_7e7e]
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_7e7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_7e7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_7e7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l422_c11_1687]
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l422_c7_98f6]
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l422_c7_98f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l422_c7_98f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c7_98f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l426_c11_ba3c]
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l426_c7_de56]
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l426_c7_de56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l426_c7_de56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l426_c7_de56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_7160]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l430_c7_3696]
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_3696]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_3696]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_3696]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l432_c34_c6db]
signal CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l434_c11_2025]
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l434_c7_9f91]
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l434_c7_9f91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l434_c7_9f91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l434_c7_9f91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l438_c11_f126]
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l438_c7_e9e2]
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_e9e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_e9e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_e9e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l442_c11_1b09]
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l442_c7_950b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l442_c7_950b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output);

-- n16_MUX_uxn_opcodes_h_l378_c2_e4f1
n16_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- t16_MUX_uxn_opcodes_h_l378_c2_e4f1
t16_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1
result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

-- printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653
printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653 : entity work.printf_uxn_opcodes_h_l379_c3_0653_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a
BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output);

-- n16_MUX_uxn_opcodes_h_l384_c7_64d0
n16_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
n16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
n16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- t16_MUX_uxn_opcodes_h_l384_c7_64d0
t16_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
t16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
t16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0
result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f
BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output);

-- n16_MUX_uxn_opcodes_h_l387_c7_6c9a
n16_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- t16_MUX_uxn_opcodes_h_l387_c7_6c9a
t16_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a
result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851
BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output);

-- n16_MUX_uxn_opcodes_h_l392_c7_02fe
n16_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
n16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
n16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- t16_MUX_uxn_opcodes_h_l392_c7_02fe
t16_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
t16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
t16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe
result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb
BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_left,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_right,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output);

-- n16_MUX_uxn_opcodes_h_l395_c7_4c43
n16_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
n16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
n16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- t16_MUX_uxn_opcodes_h_l395_c7_4c43
t16_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
t16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
t16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43
result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4
BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_left,
BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_right,
BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15
BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_left,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_right,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output);

-- n16_MUX_uxn_opcodes_h_l399_c7_bb5f
n16_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f
result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506
BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_left,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_right,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output);

-- n16_MUX_uxn_opcodes_h_l402_c7_0d6a
n16_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a
result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29
BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_left,
BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_right,
BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output);

-- n16_MUX_uxn_opcodes_h_l407_c7_4d27
n16_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
n16_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
n16_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27
result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3
BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_left,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_right,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output);

-- n16_MUX_uxn_opcodes_h_l410_c7_858b
n16_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l410_c7_858b_cond,
n16_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
n16_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b
result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l411_c3_0515
BIN_OP_OR_uxn_opcodes_h_l411_c3_0515 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_left,
BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_right,
BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13
BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_left,
BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_right,
BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f
BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_left,
BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_right,
BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output);

-- MUX_uxn_opcodes_h_l414_c32_823d
MUX_uxn_opcodes_h_l414_c32_823d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l414_c32_823d_cond,
MUX_uxn_opcodes_h_l414_c32_823d_iftrue,
MUX_uxn_opcodes_h_l414_c32_823d_iffalse,
MUX_uxn_opcodes_h_l414_c32_823d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_left,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_right,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e
result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687
BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_left,
BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_right,
BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6
result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_left,
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_right,
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56
result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_cond,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160
BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696
result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_cond,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output);

-- CONST_SR_8_uxn_opcodes_h_l432_c34_c6db
CONST_SR_8_uxn_opcodes_h_l432_c34_c6db : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_x,
CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025
BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_left,
BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_right,
BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91
result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_cond,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126
BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_left,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_right,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2
result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09
BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_left,
BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_right,
BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d
CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output,
 n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output,
 n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output,
 n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output,
 n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output,
 n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output,
 BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output,
 n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output,
 n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output,
 n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output,
 n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output,
 BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output,
 BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output,
 MUX_uxn_opcodes_h_l414_c32_823d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output,
 CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_728c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_cace : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_b21c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_961e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_c27a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_83a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_d7a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_a80f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_823d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_823d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_823d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_823d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_a6b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_9b64 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_3d87 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_7492_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_03e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_3e02_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_e933 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_db17 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l388_l403_l411_l396_DUPLICATE_f4ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_611d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_9204_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l440_l424_DUPLICATE_3600_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l447_l374_DUPLICATE_564d_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l414_c32_823d_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_03e4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_03e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_83a5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_83a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l414_c32_823d_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_a6b0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_a6b0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_cace := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_cace;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_b21c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_b21c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_a80f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_a80f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_9b64 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_9b64;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_e933 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_e933;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_3d87 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_3d87;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_d7a2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_d7a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_728c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_728c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_c27a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_c27a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_db17 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_db17;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_961e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_961e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_right := to_unsigned(11, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l432_c34_c6db] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_x <= VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output := CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l438_c11_f126] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_left;
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output := BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l395_c11_6bbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l434_c11_2025] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_left;
     BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output := BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l388_l403_l411_l396_DUPLICATE_f4ca LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l388_l403_l411_l396_DUPLICATE_f4ca_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l407_c11_4f29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_left;
     BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output := BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c11_7851] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l416_c11_ffaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_611d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_611d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l414_c32_0b13] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_left;
     BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output := BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c11_372f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c6_f797] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l428_c24_7492] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_7492_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_9204 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_9204_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l422_c11_1687] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_left;
     BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output := BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l410_c11_48c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l399_c11_0e15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_left;
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output := BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l426_c11_ba3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_e21a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l442_c11_1b09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_left;
     BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output := BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l402_c11_e506] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_left;
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output := BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_7160] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_0b13_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_f797_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_e21a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_372f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_7851_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_6bbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_0e15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_e506_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_4f29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_48c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ffaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_1687_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ba3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_7160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_2025_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_f126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_1b09_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l388_l403_l411_l396_DUPLICATE_f4ca_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l388_l403_l411_l396_DUPLICATE_f4ca_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l388_l403_l411_l396_DUPLICATE_f4ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_7492_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_9204_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_9204_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l378_l402_DUPLICATE_37a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l416_l442_l387_l410_l438_l384_l407_l434_l402_l430_DUPLICATE_053d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l399_l395_l392_l416_l387_l384_l407_l378_l402_DUPLICATE_df24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l384_l407_l402_DUPLICATE_a39e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l399_l426_l395_l422_l392_l442_l387_l410_l438_l384_l407_l434_l378_l402_l430_DUPLICATE_0530_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_611d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_611d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l399_l395_l392_l387_l410_l438_l384_l407_l378_l402_DUPLICATE_81e9_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l411_c3_0515] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_left;
     BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output := BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l396_c3_68b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_left;
     BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output := BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_7e7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l378_c1_1e94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l440_l424_DUPLICATE_3600 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l440_l424_DUPLICATE_3600_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_27ae_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l432_c24_3e02] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_3e02_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_c6db_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_e9e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l442_c7_950b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l414_c32_3d9f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_left;
     BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output := BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l442_c7_950b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l414_c32_823d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_3d9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_68b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_0515_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_3e02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l440_l424_DUPLICATE_3600_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l440_l424_DUPLICATE_3600_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l389_l404_DUPLICATE_e43d_return_output;
     VAR_printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_1e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_950b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_950b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_e9e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     n16_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     n16_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output := n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_e9e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;

     -- printf_uxn_opcodes_h_l379_c3_0653[uxn_opcodes_h_l379_c3_0653] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l379_c3_0653_uxn_opcodes_h_l379_c3_0653_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l434_c7_9f91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l438_c7_e9e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     t16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     t16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- MUX[uxn_opcodes_h_l414_c32_823d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l414_c32_823d_cond <= VAR_MUX_uxn_opcodes_h_l414_c32_823d_cond;
     MUX_uxn_opcodes_h_l414_c32_823d_iftrue <= VAR_MUX_uxn_opcodes_h_l414_c32_823d_iftrue;
     MUX_uxn_opcodes_h_l414_c32_823d_iffalse <= VAR_MUX_uxn_opcodes_h_l414_c32_823d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l414_c32_823d_return_output := MUX_uxn_opcodes_h_l414_c32_823d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue := VAR_MUX_uxn_opcodes_h_l414_c32_823d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_n16_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_e9e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     -- n16_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     n16_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     n16_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l434_c7_9f91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l434_c7_9f91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_3696] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     t16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     t16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l434_c7_9f91] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_cond;
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output := result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3696_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_9f91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- t16_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l426_c7_de56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_3696] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- n16_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l430_c7_3696] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_cond;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output := result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_3696] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3696_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3696_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_de56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_3696_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     -- n16_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c7_98f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l426_c7_de56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l426_c7_de56] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_cond;
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output := result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l426_c7_de56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output;

     -- t16_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     t16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     t16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_n16_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_de56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_de56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_de56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_7e7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l422_c7_98f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l422_c7_98f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l422_c7_98f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     n16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     n16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_98f6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;
     -- n16_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     n16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     n16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_7e7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l416_c7_7e7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_7e7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_7e7e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- n16_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_858b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_858b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     n16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     n16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l407_c7_4d27] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_cond;
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output := result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_4d27_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- n16_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_0d6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_0d6a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_bb5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_bb5f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l395_c7_4c43] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_cond;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output := result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_4c43_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_02fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_02fe_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_6c9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_6c9a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l384_c7_64d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_64d0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c2_e4f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l447_l374_DUPLICATE_564d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l447_l374_DUPLICATE_564d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_e4f1_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l447_l374_DUPLICATE_564d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l447_l374_DUPLICATE_564d_return_output;
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
