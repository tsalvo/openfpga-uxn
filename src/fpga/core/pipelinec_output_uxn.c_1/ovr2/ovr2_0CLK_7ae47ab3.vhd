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
-- Submodules: 81
entity ovr2_0CLK_7ae47ab3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_7ae47ab3;
architecture arch of ovr2_0CLK_7ae47ab3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l337_c6_0977]
signal BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal n16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal t16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l337_c2_9d3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l344_c11_7bb0]
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l344_c7_f492]
signal n16_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l344_c7_f492]
signal t16_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l344_c7_f492]
signal result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l344_c7_f492]
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l344_c7_f492]
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c7_f492]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c7_f492]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l347_c11_3ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal n16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal t16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l347_c7_3ebf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0235]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal n16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal t16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_cfbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l353_c3_8079]
signal BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l356_c11_4e28]
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l356_c7_2019]
signal n16_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l356_c7_2019]
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_2019]
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_2019]
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_2019]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_2019]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l360_c30_739b]
signal sp_relative_shift_uxn_opcodes_h_l360_c30_739b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l360_c30_739b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l360_c30_739b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l365_c11_cea0]
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l365_c7_1437]
signal n16_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l365_c7_1437]
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l365_c7_1437]
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l365_c7_1437]
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l365_c7_1437]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l365_c7_1437]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l366_c3_e50d]
signal BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l369_c31_15d3]
signal CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l371_c11_52a0]
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_0dca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l371_c7_0dca]
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_0dca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_0dca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l375_c11_3195]
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l375_c7_340f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l375_c7_340f]
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l375_c7_340f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l375_c7_340f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l379_c11_ffcd]
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_cf2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l379_c7_cf2d]
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_cf2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_cf2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l383_c11_e1c4]
signal BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l383_c7_c4bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l383_c7_c4bc]
signal result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l383_c7_c4bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l383_c7_c4bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l387_c11_b9ae]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_fc81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_fc81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977
BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_left,
BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_right,
BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output);

-- n16_MUX_uxn_opcodes_h_l337_c2_9d3c
n16_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- t16_MUX_uxn_opcodes_h_l337_c2_9d3c
t16_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c
result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c
result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c
result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0
BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_left,
BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_right,
BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output);

-- n16_MUX_uxn_opcodes_h_l344_c7_f492
n16_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l344_c7_f492_cond,
n16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
n16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- t16_MUX_uxn_opcodes_h_l344_c7_f492
t16_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l344_c7_f492_cond,
t16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
t16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492
result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_cond,
result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7
BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output);

-- n16_MUX_uxn_opcodes_h_l347_c7_3ebf
n16_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- t16_MUX_uxn_opcodes_h_l347_c7_3ebf
t16_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf
result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output);

-- n16_MUX_uxn_opcodes_h_l352_c7_cfbe
n16_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- t16_MUX_uxn_opcodes_h_l352_c7_cfbe
t16_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe
result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l353_c3_8079
BIN_OP_OR_uxn_opcodes_h_l353_c3_8079 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_left,
BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_right,
BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28
BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_left,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_right,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output);

-- n16_MUX_uxn_opcodes_h_l356_c7_2019
n16_MUX_uxn_opcodes_h_l356_c7_2019 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l356_c7_2019_cond,
n16_MUX_uxn_opcodes_h_l356_c7_2019_iftrue,
n16_MUX_uxn_opcodes_h_l356_c7_2019_iffalse,
n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019
result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_cond,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output);

-- sp_relative_shift_uxn_opcodes_h_l360_c30_739b
sp_relative_shift_uxn_opcodes_h_l360_c30_739b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l360_c30_739b_ins,
sp_relative_shift_uxn_opcodes_h_l360_c30_739b_x,
sp_relative_shift_uxn_opcodes_h_l360_c30_739b_y,
sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0
BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_left,
BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_right,
BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output);

-- n16_MUX_uxn_opcodes_h_l365_c7_1437
n16_MUX_uxn_opcodes_h_l365_c7_1437 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l365_c7_1437_cond,
n16_MUX_uxn_opcodes_h_l365_c7_1437_iftrue,
n16_MUX_uxn_opcodes_h_l365_c7_1437_iffalse,
n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437
result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_cond,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d
BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_left,
BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_right,
BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l369_c31_15d3
CONST_SR_8_uxn_opcodes_h_l369_c31_15d3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_x,
CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0
BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_left,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_right,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca
result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_cond,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195
BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_left,
BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_right,
BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f
result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_cond,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f
result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd
BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_left,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_right,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d
result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4
BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_left,
BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_right,
BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc
result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae
BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c
CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8
CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output,
 n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output,
 n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output,
 n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output,
 n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output,
 BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output,
 n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output,
 sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output,
 n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output,
 BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output,
 CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_7031 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_9d13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_2616 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_9e65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_9d98 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l363_c21_9238_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l368_c3_9407 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l367_c3_7f4f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l369_c21_2d7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_b13e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l376_c3_0d9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l380_c3_afd4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_8b6c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l383_c7_c4bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l366_l348_l357_l353_DUPLICATE_6500_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l373_l381_DUPLICATE_28f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l385_l377_DUPLICATE_a608_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l392_l333_DUPLICATE_ec69_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_7031 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_7031;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l376_c3_0d9b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l376_c3_0d9b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_b13e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_b13e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_2616 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_2616;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_9e65 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_9e65;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_9d98 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_9d98;
     VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_8b6c := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_8b6c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l368_c3_9407 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l368_c3_9407;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_9d13 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_9d13;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l380_c3_afd4 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l380_c3_afd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_right := to_unsigned(9, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l367_c3_7f4f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l367_c3_7f4f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l371_c11_52a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l356_c11_4e28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_left;
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output := BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l360_c30_739b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l360_c30_739b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_ins;
     sp_relative_shift_uxn_opcodes_h_l360_c30_739b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_x;
     sp_relative_shift_uxn_opcodes_h_l360_c30_739b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output := sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l363_c21_9238] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l363_c21_9238_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l383_c7_c4bc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l383_c7_c4bc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l383_c11_e1c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l337_c6_0977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_left;
     BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output := BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l375_c11_3195] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_left;
     BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output := BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l347_c11_3ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l344_c11_7bb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l369_c31_15d3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output := CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l366_l348_l357_l353_DUPLICATE_6500 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l366_l348_l357_l353_DUPLICATE_6500_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l365_c11_cea0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_left;
     BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output := BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c11_b9ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l373_l381_DUPLICATE_28f0 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l373_l381_DUPLICATE_28f0_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l379_c11_ffcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c6_0977_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_7bb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_3ee7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0235_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_4e28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_cea0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_52a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_3195_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_ffcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_e1c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_b9ae_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l366_l348_l357_l353_DUPLICATE_6500_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l366_l348_l357_l353_DUPLICATE_6500_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l366_l348_l357_l353_DUPLICATE_6500_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l363_c21_9238_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l373_l381_DUPLICATE_28f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l373_l381_DUPLICATE_28f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l347_l344_l337_l365_l352_DUPLICATE_2967_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l347_l379_l344_l375_l371_l365_l356_l387_l352_l383_DUPLICATE_1b76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l347_l379_l344_l375_l337_l371_l365_l387_l352_l383_DUPLICATE_8cb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l347_l344_l337_l352_l383_DUPLICATE_fc22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l383_c7_c4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l360_c30_739b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l383_c7_c4bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_fc81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l366_c3_e50d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_left;
     BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output := BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l365_c7_1437] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l369_c21_2d7b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l369_c21_2d7b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l369_c31_15d3_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l353_c3_8079] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_left;
     BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output := BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_fc81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l385_l377_DUPLICATE_a608 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l385_l377_DUPLICATE_a608_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l377_l385_DUPLICATE_2bb8_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l353_c3_8079_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l366_c3_e50d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l369_c21_2d7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l385_l377_DUPLICATE_a608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l385_l377_DUPLICATE_a608_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l349_l358_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_fc81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_fc81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_1437_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;
     -- n16_MUX[uxn_opcodes_h_l365_c7_1437] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l365_c7_1437_cond <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_cond;
     n16_MUX_uxn_opcodes_h_l365_c7_1437_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_iftrue;
     n16_MUX_uxn_opcodes_h_l365_c7_1437_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output := n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l383_c7_c4bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_2019] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_cf2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l383_c7_c4bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l383_c7_c4bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_iffalse := VAR_n16_MUX_uxn_opcodes_h_l365_c7_1437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_2019_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l383_c7_c4bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l379_c7_cf2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l375_c7_340f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output;

     -- t16_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_cf2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;

     -- n16_MUX[uxn_opcodes_h_l356_c7_2019] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l356_c7_2019_cond <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_cond;
     n16_MUX_uxn_opcodes_h_l356_c7_2019_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_iftrue;
     n16_MUX_uxn_opcodes_h_l356_c7_2019_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output := n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_cf2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l356_c7_2019_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_340f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_cf2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_t16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_0dca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;

     -- n16_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l375_c7_340f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output := result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l375_c7_340f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l375_c7_340f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- t16_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     t16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     t16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output := t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_340f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l375_c7_340f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_340f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     -- t16_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l365_c7_1437] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l371_c7_0dca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output := result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_0dca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_0dca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_n16_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_1437_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_0dca_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l365_c7_1437] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_2019] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output;

     -- n16_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     n16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     n16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output := n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l365_c7_1437] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l365_c7_1437] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_cond;
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output := result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_1437_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_1437_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_2019_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_1437_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l356_c7_2019] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_cond;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output := result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_2019] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- n16_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_2019] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_2019_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_2019_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_2019_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_cfbe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_cfbe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l347_c7_3ebf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output := result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l347_c7_3ebf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l344_c7_f492] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_cond;
     result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output := result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c7_f492_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l337_c2_9d3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l392_l333_DUPLICATE_ec69 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l392_l333_DUPLICATE_ec69_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c2_9d3c_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l392_l333_DUPLICATE_ec69_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l392_l333_DUPLICATE_ec69_return_output;
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
