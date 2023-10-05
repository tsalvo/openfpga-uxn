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
-- Submodules: 96
entity lda_0CLK_d853ed1b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_d853ed1b;
architecture arch of lda_0CLK_d853ed1b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1412_c6_1575]
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1412_c1_5fd9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1412_c2_a8c7]
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1413_c3_a194[uxn_opcodes_h_l1413_c3_a194]
signal printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_0f0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal t16_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1418_c7_34f1]
signal tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_38d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal t16_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1421_c7_bd88]
signal tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1423_c3_6cd5]
signal CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1426_c11_da4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1426_c7_a445]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1426_c7_a445]
signal t16_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1426_c7_a445]
signal tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1429_c11_1c6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1429_c7_d9d0]
signal tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1430_c3_448a]
signal BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1433_c32_9971]
signal BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1433_c32_ff5c]
signal BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1433_c32_d92d]
signal MUX_uxn_opcodes_h_l1433_c32_d92d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1433_c32_d92d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1433_c32_d92d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1433_c32_d92d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_3a08]
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1435_c7_b9f3]
signal tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_afd6]
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1440_c7_a0af]
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1443_c11_83f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1443_c7_93c7]
signal result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1443_c7_93c7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1443_c7_93c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1443_c7_93c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1443_c7_93c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1443_c7_93c7]
signal tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_9fe2]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_3b11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_3b11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_0a09( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_left,
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_right,
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- t16_MUX_uxn_opcodes_h_l1412_c2_a8c7
t16_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7
tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond,
tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

-- printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194
printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194 : entity work.printf_uxn_opcodes_h_l1413_c3_a194_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1
result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1
result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- t16_MUX_uxn_opcodes_h_l1418_c7_34f1
t16_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1
tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_cond,
tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue,
tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse,
tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88
result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88
result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- t16_MUX_uxn_opcodes_h_l1421_c7_bd88
t16_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88
tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_cond,
tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue,
tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse,
tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5
CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_x,
CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b
BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445
result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445
result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445
result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445
result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445
result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445
result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445
result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445
result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- t16_MUX_uxn_opcodes_h_l1426_c7_a445
t16_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
t16_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
t16_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1426_c7_a445
tmp8_MUX_uxn_opcodes_h_l1426_c7_a445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_cond,
tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue,
tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse,
tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e
BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0
result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- t16_MUX_uxn_opcodes_h_l1429_c7_d9d0
t16_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0
tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond,
tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a
BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_left,
BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_right,
BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971
BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_left,
BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_right,
BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c
BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_left,
BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_right,
BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output);

-- MUX_uxn_opcodes_h_l1433_c32_d92d
MUX_uxn_opcodes_h_l1433_c32_d92d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1433_c32_d92d_cond,
MUX_uxn_opcodes_h_l1433_c32_d92d_iftrue,
MUX_uxn_opcodes_h_l1433_c32_d92d_iffalse,
MUX_uxn_opcodes_h_l1433_c32_d92d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_left,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_right,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3
tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond,
tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_left,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_right,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af
result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af
result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af
tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_cond,
tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue,
tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse,
tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4
BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7
result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7
result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7
result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7
result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7
tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_cond,
tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output,
 CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output,
 MUX_uxn_opcodes_h_l1433_c32_d92d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_9dfc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1419_c3_157f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1424_c3_8b6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_a677 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1447_c3_d555 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1422_l1430_DUPLICATE_fc3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1455_l1407_DUPLICATE_8d3d_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_9dfc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_9dfc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1424_c3_8b6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1424_c3_8b6a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_a677 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_a677;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1447_c3_d555 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1447_c3_d555;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1419_c3_157f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1419_c3_157f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_0f0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1412_c6_1575] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_left;
     BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output := BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1422_l1430_DUPLICATE_fc3e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1422_l1430_DUPLICATE_fc3e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_afd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_3a08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output := result.ram_addr;

     -- BIN_OP_AND[uxn_opcodes_h_l1433_c32_9971] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_left;
     BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output := BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_9fe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1429_c11_1c6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_38d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1426_c11_da4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1443_c11_83f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1433_c32_9971_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_1575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_0f0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_38d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1426_c11_da4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1429_c11_1c6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_3a08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_afd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1443_c11_83f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_9fe2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1422_l1430_DUPLICATE_fc3e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1422_l1430_DUPLICATE_fc3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_DUPLICATE_2677_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1412_l1440_DUPLICATE_eb11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1443_l1440_l1435_DUPLICATE_6d6b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_DUPLICATE_ff25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1426_l1421_l1418_l1412_l1435_DUPLICATE_59ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1429_l1421_l1426_DUPLICATE_b380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1450_l1418_l1412_l1440_l1435_DUPLICATE_826c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1440_l1429_l1443_l1435_DUPLICATE_ad4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1429_l1426_l1421_l1418_l1443_l1412_l1440_l1435_DUPLICATE_d73a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1433_c32_ff5c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_left;
     BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output := BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1430_c3_448a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_left;
     BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output := BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1423_c3_6cd5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output := CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1443_c7_93c7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_3b11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1443_c7_93c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1412_c1_5fd9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1443_c7_93c7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_cond;
     tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output := tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_3b11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1443_c7_93c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1433_c32_ff5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1430_c3_448a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1423_c3_6cd5_return_output;
     VAR_printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1412_c1_5fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_3b11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- t16_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1443_c7_93c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;

     -- MUX[uxn_opcodes_h_l1433_c32_d92d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1433_c32_d92d_cond <= VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_cond;
     MUX_uxn_opcodes_h_l1433_c32_d92d_iftrue <= VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_iftrue;
     MUX_uxn_opcodes_h_l1433_c32_d92d_iffalse <= VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_return_output := MUX_uxn_opcodes_h_l1433_c32_d92d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- printf_uxn_opcodes_h_l1413_c3_a194[uxn_opcodes_h_l1413_c3_a194] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1413_c3_a194_uxn_opcodes_h_l1413_c3_a194_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1443_c7_93c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue := VAR_MUX_uxn_opcodes_h_l1433_c32_d92d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1443_c7_93c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_a0af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- t16_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     t16_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     t16_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_a0af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_b9f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_b9f3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1429_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- t16_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1429_c7_d9d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1426_c7_a445] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1426_c7_a445_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_bd88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_bd88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_34f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_34f1_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1412_c2_a8c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1455_l1407_DUPLICATE_8d3d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1455_l1407_DUPLICATE_8d3d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0a09(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_a8c7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1455_l1407_DUPLICATE_8d3d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1455_l1407_DUPLICATE_8d3d_return_output;
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
