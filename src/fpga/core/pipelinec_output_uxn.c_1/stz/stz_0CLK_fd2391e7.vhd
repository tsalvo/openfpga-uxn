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
-- Submodules: 63
entity stz_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_fd2391e7;
architecture arch of stz_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1722_c6_5607]
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1722_c1_d3bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1722_c2_a1a8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1723_c3_086b[uxn_opcodes_h_l1723_c3_086b]
signal printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1728_c11_4d0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal t8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal n8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1728_c7_55b5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_a06d]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_f3a7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1735_c11_a1da]
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal n8_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1735_c7_72e5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_f891]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1738_c7_5590]
signal n8_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_5590]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1742_c32_dc94]
signal BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1742_c32_9f84]
signal BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1742_c32_0684]
signal MUX_uxn_opcodes_h_l1742_c32_0684_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1742_c32_0684_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1742_c32_0684_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1742_c32_0684_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_62d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_34fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1747_c7_34fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1747_c7_34fd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd01( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_left,
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_right,
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output);

-- t8_MUX_uxn_opcodes_h_l1722_c2_a1a8
t8_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- n8_MUX_uxn_opcodes_h_l1722_c2_a1a8
n8_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

-- printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b
printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b : entity work.printf_uxn_opcodes_h_l1723_c3_086b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output);

-- t8_MUX_uxn_opcodes_h_l1728_c7_55b5
t8_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- n8_MUX_uxn_opcodes_h_l1728_c7_55b5
n8_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5
result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5
result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5
result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_f3a7
t8_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- n8_MUX_uxn_opcodes_h_l1731_c7_f3a7
n8_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_left,
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_right,
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output);

-- n8_MUX_uxn_opcodes_h_l1735_c7_72e5
n8_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5
result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5
result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5
result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5
result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output);

-- n8_MUX_uxn_opcodes_h_l1738_c7_5590
n8_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
n8_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
n8_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590
result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590
result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94
BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_left,
BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_right,
BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84
BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_left,
BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_right,
BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output);

-- MUX_uxn_opcodes_h_l1742_c32_0684
MUX_uxn_opcodes_h_l1742_c32_0684 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1742_c32_0684_cond,
MUX_uxn_opcodes_h_l1742_c32_0684_iftrue,
MUX_uxn_opcodes_h_l1742_c32_0684_iffalse,
MUX_uxn_opcodes_h_l1742_c32_0684_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output,
 t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output,
 t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output,
 n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output,
 n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output,
 MUX_uxn_opcodes_h_l1742_c32_0684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1725_c3_4a00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1729_c3_10a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1733_c3_9d7e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_fdf1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1735_c7_72e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1742_c32_0684_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1742_c32_0684_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1742_c32_0684_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1742_c32_0684_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1744_c21_71b8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1718_l1753_DUPLICATE_0a26_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1742_c32_0684_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_fdf1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_fdf1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1733_c3_9d7e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1733_c3_9d7e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1742_c32_0684_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1725_c3_4a00 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1725_c3_4a00;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1729_c3_10a1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1729_c3_10a1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1744_c21_71b8] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1744_c21_71b8_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_f891] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1728_c11_4d0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1742_c32_dc94] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_left;
     BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output := BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_62d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1735_c11_a1da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1735_c7_72e5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_a06d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1722_c6_5607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_left;
     BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output := BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1742_c32_dc94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_5607_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_4d0b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_a06d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_a1da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_62d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1744_c21_71b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_924d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_b85b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1747_DUPLICATE_980d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_f43d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1735_l1731_l1728_l1722_l1747_DUPLICATE_7760_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1738_l1731_l1735_l1728_DUPLICATE_0daf_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1738_l1735_l1731_l1728_l1722_DUPLICATE_60d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1735_c7_72e5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1722_c1_d3bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1747_c7_34fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_34fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output;

     -- n8_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     n8_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     n8_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1747_c7_34fd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1742_c32_9f84] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_left;
     BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output := BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1742_c32_0684_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1742_c32_9f84_return_output;
     VAR_printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1722_c1_d3bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_34fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     -- t8_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- printf_uxn_opcodes_h_l1723_c3_086b[uxn_opcodes_h_l1723_c3_086b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1723_c3_086b_uxn_opcodes_h_l1723_c3_086b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- MUX[uxn_opcodes_h_l1742_c32_0684] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1742_c32_0684_cond <= VAR_MUX_uxn_opcodes_h_l1742_c32_0684_cond;
     MUX_uxn_opcodes_h_l1742_c32_0684_iftrue <= VAR_MUX_uxn_opcodes_h_l1742_c32_0684_iftrue;
     MUX_uxn_opcodes_h_l1742_c32_0684_iffalse <= VAR_MUX_uxn_opcodes_h_l1742_c32_0684_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1742_c32_0684_return_output := MUX_uxn_opcodes_h_l1742_c32_0684_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue := VAR_MUX_uxn_opcodes_h_l1742_c32_0684_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- n8_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_5590] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1735_c7_72e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_72e5_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_f3a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_f3a7_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1728_c7_55b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c7_55b5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c2_a1a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1718_l1753_DUPLICATE_0a26 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1718_l1753_DUPLICATE_0a26_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd01(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_a1a8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1718_l1753_DUPLICATE_0a26_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1718_l1753_DUPLICATE_0a26_return_output;
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
