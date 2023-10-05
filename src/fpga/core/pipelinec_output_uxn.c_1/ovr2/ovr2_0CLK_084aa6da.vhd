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
-- BIN_OP_EQ[uxn_opcodes_h_l378_c6_4bf3]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l378_c1_f782]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal n16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l378_c2_d8fc]
signal t16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l379_c3_d87e[uxn_opcodes_h_l379_c3_d87e]
signal printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_d45f]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l384_c7_1c21]
signal n16_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_1c21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l384_c7_1c21]
signal t16_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l387_c11_7c6f]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l387_c7_9563]
signal n16_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_9563]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l387_c7_9563]
signal t16_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l392_c11_a4c8]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l392_c7_8def]
signal n16_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_8def]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l392_c7_8def]
signal t16_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l395_c11_bf89]
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l395_c7_60a5]
signal n16_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_60a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l395_c7_60a5]
signal t16_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l396_c3_d4f7]
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l399_c11_4f0e]
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal n16_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_4ab6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l402_c11_a903]
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal n16_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_3ba9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l407_c11_51f2]
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l407_c7_857f]
signal n16_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l407_c7_857f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l410_c11_7b16]
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal n16_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_ff2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l411_c3_4f74]
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l414_c32_fc6f]
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l414_c32_86ea]
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l414_c32_6923]
signal MUX_uxn_opcodes_h_l414_c32_6923_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_6923_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_6923_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l414_c32_6923_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l416_c11_c032]
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l416_c7_f59c]
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_f59c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_f59c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_f59c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_f59c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l422_c11_3055]
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l422_c7_f940]
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l422_c7_f940]
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c7_f940]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l422_c7_f940]
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l426_c11_ef49]
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l426_c7_1644]
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l426_c7_1644]
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l426_c7_1644]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l426_c7_1644]
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_ff12]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l430_c7_2b75]
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_2b75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_2b75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_2b75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l432_c34_d064]
signal CONST_SR_8_uxn_opcodes_h_l432_c34_d064_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l434_c11_1386]
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l434_c7_53d5]
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l434_c7_53d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l434_c7_53d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l434_c7_53d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l438_c11_eddd]
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l438_c7_2c8d]
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_2c8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_2c8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_2c8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l442_c11_6be3]
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l442_c7_8c2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l442_c7_8c2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3
BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output);

-- n16_MUX_uxn_opcodes_h_l378_c2_d8fc
n16_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc
result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- t16_MUX_uxn_opcodes_h_l378_c2_d8fc
t16_MUX_uxn_opcodes_h_l378_c2_d8fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond,
t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue,
t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse,
t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

-- printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e
printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e : entity work.printf_uxn_opcodes_h_l379_c3_d87e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f
BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output);

-- n16_MUX_uxn_opcodes_h_l384_c7_1c21
n16_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
n16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
n16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21
result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- t16_MUX_uxn_opcodes_h_l384_c7_1c21
t16_MUX_uxn_opcodes_h_l384_c7_1c21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l384_c7_1c21_cond,
t16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue,
t16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse,
t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f
BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output);

-- n16_MUX_uxn_opcodes_h_l387_c7_9563
n16_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l387_c7_9563_cond,
n16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
n16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563
result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- t16_MUX_uxn_opcodes_h_l387_c7_9563
t16_MUX_uxn_opcodes_h_l387_c7_9563 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l387_c7_9563_cond,
t16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue,
t16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse,
t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8
BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output);

-- n16_MUX_uxn_opcodes_h_l392_c7_8def
n16_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l392_c7_8def_cond,
n16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
n16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def
result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- t16_MUX_uxn_opcodes_h_l392_c7_8def
t16_MUX_uxn_opcodes_h_l392_c7_8def : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l392_c7_8def_cond,
t16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue,
t16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse,
t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89
BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_left,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_right,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output);

-- n16_MUX_uxn_opcodes_h_l395_c7_60a5
n16_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
n16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
n16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5
result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- t16_MUX_uxn_opcodes_h_l395_c7_60a5
t16_MUX_uxn_opcodes_h_l395_c7_60a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l395_c7_60a5_cond,
t16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue,
t16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse,
t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7
BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_left,
BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_right,
BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_left,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_right,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output);

-- n16_MUX_uxn_opcodes_h_l399_c7_4ab6
n16_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6
result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903
BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_left,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_right,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output);

-- n16_MUX_uxn_opcodes_h_l402_c7_3ba9
n16_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9
result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2
BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_left,
BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_right,
BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output);

-- n16_MUX_uxn_opcodes_h_l407_c7_857f
n16_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l407_c7_857f_cond,
n16_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
n16_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f
result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16
BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_left,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_right,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output);

-- n16_MUX_uxn_opcodes_h_l410_c7_ff2f
n16_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f
result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74
BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_left,
BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_right,
BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f
BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_left,
BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_right,
BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea
BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_left,
BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_right,
BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output);

-- MUX_uxn_opcodes_h_l414_c32_6923
MUX_uxn_opcodes_h_l414_c32_6923 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l414_c32_6923_cond,
MUX_uxn_opcodes_h_l414_c32_6923_iftrue,
MUX_uxn_opcodes_h_l414_c32_6923_iffalse,
MUX_uxn_opcodes_h_l414_c32_6923_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032
BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_left,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_right,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c
result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_cond,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055
BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_left,
BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_right,
BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940
result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_cond,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_left,
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_right,
BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_cond,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12
BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75
result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_cond,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output);

-- CONST_SR_8_uxn_opcodes_h_l432_c34_d064
CONST_SR_8_uxn_opcodes_h_l432_c34_d064 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l432_c34_d064_x,
CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386
BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_left,
BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_right,
BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5
result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd
BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_left,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_right,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d
result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_cond,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_left,
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_right,
BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79
CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output,
 n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output,
 n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output,
 n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output,
 n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output,
 n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output,
 n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output,
 n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output,
 n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output,
 n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output,
 BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output,
 MUX_uxn_opcodes_h_l414_c32_6923_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output,
 CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_cfc4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_4ec8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_6817 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_3a50 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_5c26 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_4de8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_60c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_d18e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_6923_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_6923_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_6923_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l414_c32_6923_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_afbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_26f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_1ba8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_976b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_2a2b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_d064_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_90ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_acd8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_4aff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l388_l411_l403_DUPLICATE_626a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_4d89_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_4f1c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_be33_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l447_l374_DUPLICATE_be66_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_4de8 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l400_c3_4de8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_3a50 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_3a50;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_acd8 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l435_c3_acd8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_1ba8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_1ba8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l414_c32_6923_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_4ec8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_4ec8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_cfc4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_cfc4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_60c5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_60c5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_26f1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l423_c3_26f1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_d18e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l408_c3_d18e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_afbc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l419_c3_afbc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_5c26 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_5c26;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_4aff := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_4aff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_2a2b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_2a2b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_6817 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_6817;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l414_c32_6923_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_d064_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l392_c11_a4c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_4d89 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_4d89_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l407_c11_51f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l416_c11_c032] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_left;
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output := BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l399_c11_4f0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l414_c32_fc6f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_left;
     BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output := BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_4f1c LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_4f1c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l395_c11_bf89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_left;
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output := BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l438_c11_eddd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_left;
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output := BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l410_c11_7b16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_left;
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output := BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_ff12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l442_c11_6be3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_left;
     BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output := BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_d45f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l426_c11_ef49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_left;
     BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output := BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l402_c11_a903] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_left;
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output := BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l428_c24_976b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_976b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l434_c11_1386] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_left;
     BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output := BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c11_7c6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l432_c34_d064] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l432_c34_d064_x <= VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_d064_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output := CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l388_l411_l403_DUPLICATE_626a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l388_l411_l403_DUPLICATE_626a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c6_4bf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l422_c11_3055] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_left;
     BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output := BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_left := VAR_BIN_OP_AND_uxn_opcodes_h_l414_c32_fc6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c6_4bf3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_d45f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_7c6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_a4c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_bf89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4f0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_a903_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c11_51f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_7b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_c032_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c11_3055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l426_c11_ef49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_ff12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l434_c11_1386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_eddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c11_6be3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l388_l411_l403_DUPLICATE_626a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l388_l411_l403_DUPLICATE_626a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l396_l388_l411_l403_DUPLICATE_626a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l428_c24_976b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_4f1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l420_l436_DUPLICATE_4f1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_l378_DUPLICATE_70eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l426_l416_DUPLICATE_b437_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l402_l407_l399_l395_l387_l392_l384_l378_l416_DUPLICATE_f4b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l410_l402_l407_l399_l395_l387_l392_l384_DUPLICATE_619d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l442_l387_l434_l392_l384_l430_l422_l378_l426_DUPLICATE_3b70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_4d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l438_DUPLICATE_4d89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l410_l402_l407_l399_l438_l395_l387_l392_l384_l378_DUPLICATE_87b4_return_output;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_be33 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_be33_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_d64f_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l442_c7_8c2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_2c8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l414_c32_86ea] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_left;
     BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output := BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l432_c24_90ec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_90ec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l432_c34_d064_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l378_c1_f782] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l411_c3_4f74] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_left;
     BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output := BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_f59c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l442_c7_8c2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l396_c3_d4f7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_left;
     BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output := BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l414_c32_6923_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l414_c32_86ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l396_c3_d4f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l411_c3_4f74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l432_c24_90ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_be33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l424_l440_DUPLICATE_be33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l404_l389_DUPLICATE_6c79_return_output;
     VAR_printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l378_c1_f782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c7_8c2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;
     -- n16_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- printf_uxn_opcodes_h_l379_c3_d87e[uxn_opcodes_h_l379_c3_d87e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l379_c3_d87e_uxn_opcodes_h_l379_c3_d87e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     t16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     t16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l438_c7_2c8d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output := result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l434_c7_53d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_2c8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_2c8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- MUX[uxn_opcodes_h_l414_c32_6923] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l414_c32_6923_cond <= VAR_MUX_uxn_opcodes_h_l414_c32_6923_cond;
     MUX_uxn_opcodes_h_l414_c32_6923_iftrue <= VAR_MUX_uxn_opcodes_h_l414_c32_6923_iftrue;
     MUX_uxn_opcodes_h_l414_c32_6923_iffalse <= VAR_MUX_uxn_opcodes_h_l414_c32_6923_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l414_c32_6923_return_output := MUX_uxn_opcodes_h_l414_c32_6923_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue := VAR_MUX_uxn_opcodes_h_l414_c32_6923_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_2c8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_t16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_2b75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- t16_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     t16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     t16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output := t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l434_c7_53d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l434_c7_53d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l434_c7_53d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- n16_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     n16_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     n16_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output := n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l434_c7_53d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_t16_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_2b75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l426_c7_1644] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output;

     -- t16_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     t16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     t16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output := t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l430_c7_2b75] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_cond;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output := result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_2b75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;

     -- n16_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l426_c7_1644_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_2b75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_t16_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l426_c7_1644] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l426_c7_1644] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_cond;
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output := result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l426_c7_1644] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c7_f940] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output;

     -- t16_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     t16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     t16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- n16_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l426_c7_1644_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l426_c7_1644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c7_f940_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l426_c7_1644_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- t16_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l422_c7_f940] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output;

     -- n16_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     n16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     n16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_f59c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l422_c7_f940] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l422_c7_f940] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_cond;
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output := result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_n16_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c7_f940_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c7_f940_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c7_f940_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_f59c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- n16_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     n16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     n16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output := n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_f59c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l416_c7_f59c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output := result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_n16_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_f59c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_ff2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- n16_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     n16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     n16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output := n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l410_c7_ff2f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- n16_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     n16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     n16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l407_c7_857f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output := result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l407_c7_857f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- n16_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l402_c7_3ba9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output := result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_3ba9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l399_c7_4ab6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output := result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_4ab6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_60a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_60a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l392_c7_8def] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_cond;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output := result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_8def_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l387_c7_9563] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_cond;
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output := result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c7_9563_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_1c21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_1c21_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l378_c2_d8fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l447_l374_DUPLICATE_be66 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l447_l374_DUPLICATE_be66_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c2_d8fc_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l447_l374_DUPLICATE_be66_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l447_l374_DUPLICATE_be66_return_output;
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
