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
-- Submodules: 123
entity eor2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_201aeef3;
architecture arch of eor2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l777_c6_b1cf]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l777_c1_0800]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l777_c2_2c79]
signal tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l777_c2_2c79]
signal result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l777_c2_2c79]
signal t16_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l777_c2_2c79]
signal n16_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l778_c3_fc80[uxn_opcodes_h_l778_c3_fc80]
signal printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l783_c11_51b2]
signal BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l783_c7_6709]
signal tmp16_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l783_c7_6709]
signal result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l783_c7_6709]
signal t16_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l783_c7_6709]
signal n16_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_3862]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l786_c7_b840]
signal tmp16_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l786_c7_b840]
signal result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l786_c7_b840]
signal t16_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l786_c7_b840]
signal n16_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l791_c11_8899]
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l791_c7_f633]
signal tmp16_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l791_c7_f633]
signal result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l791_c7_f633]
signal t16_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l791_c7_f633]
signal n16_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_437f]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l794_c7_648a]
signal tmp16_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l794_c7_648a]
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l794_c7_648a]
signal t16_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l794_c7_648a]
signal n16_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l795_c3_1e75]
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l798_c11_fd12]
signal BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l798_c7_ff1e]
signal n16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l801_c11_f518]
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l801_c7_665a]
signal tmp16_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l801_c7_665a]
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l801_c7_665a]
signal n16_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_67d5]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l806_c7_b835]
signal tmp16_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l806_c7_b835]
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l806_c7_b835]
signal n16_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l809_c11_90b1]
signal BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l809_c7_5808]
signal tmp16_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l809_c7_5808]
signal result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l809_c7_5808]
signal n16_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l810_c3_5e63]
signal BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l811_c11_9bfc]
signal BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l814_c32_5ec3]
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l814_c32_d560]
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l814_c32_e0b0]
signal MUX_uxn_opcodes_h_l814_c32_e0b0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_e0b0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_e0b0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_e0b0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_0a39]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_9282]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_9282]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_9282]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_9282]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l816_c7_9282]
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_eb95]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_c49c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_c49c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_c49c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l822_c7_c49c]
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l824_c34_b271]
signal CONST_SR_8_uxn_opcodes_h_l824_c34_b271_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_366a]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_ad13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_ad13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf
BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output);

-- tmp16_MUX_uxn_opcodes_h_l777_c2_2c79
tmp16_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79
result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79
result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79
result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79
result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- t16_MUX_uxn_opcodes_h_l777_c2_2c79
t16_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
t16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
t16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- n16_MUX_uxn_opcodes_h_l777_c2_2c79
n16_MUX_uxn_opcodes_h_l777_c2_2c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l777_c2_2c79_cond,
n16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue,
n16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse,
n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

-- printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80
printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80 : entity work.printf_uxn_opcodes_h_l778_c3_fc80_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2
BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_left,
BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_right,
BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l783_c7_6709
tmp16_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l783_c7_6709_cond,
tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709
result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709
result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_cond,
result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- t16_MUX_uxn_opcodes_h_l783_c7_6709
t16_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l783_c7_6709_cond,
t16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
t16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- n16_MUX_uxn_opcodes_h_l783_c7_6709
n16_MUX_uxn_opcodes_h_l783_c7_6709 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l783_c7_6709_cond,
n16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue,
n16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse,
n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862
BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output);

-- tmp16_MUX_uxn_opcodes_h_l786_c7_b840
tmp16_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l786_c7_b840_cond,
tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840
result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_cond,
result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- t16_MUX_uxn_opcodes_h_l786_c7_b840
t16_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l786_c7_b840_cond,
t16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
t16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- n16_MUX_uxn_opcodes_h_l786_c7_b840
n16_MUX_uxn_opcodes_h_l786_c7_b840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l786_c7_b840_cond,
n16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue,
n16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse,
n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899
BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_left,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_right,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output);

-- tmp16_MUX_uxn_opcodes_h_l791_c7_f633
tmp16_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l791_c7_f633_cond,
tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633
result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_cond,
result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- t16_MUX_uxn_opcodes_h_l791_c7_f633
t16_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l791_c7_f633_cond,
t16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
t16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- n16_MUX_uxn_opcodes_h_l791_c7_f633
n16_MUX_uxn_opcodes_h_l791_c7_f633 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l791_c7_f633_cond,
n16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue,
n16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse,
n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f
BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l794_c7_648a
tmp16_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l794_c7_648a_cond,
tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a
result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a
result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_cond,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- t16_MUX_uxn_opcodes_h_l794_c7_648a
t16_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l794_c7_648a_cond,
t16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
t16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- n16_MUX_uxn_opcodes_h_l794_c7_648a
n16_MUX_uxn_opcodes_h_l794_c7_648a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l794_c7_648a_cond,
n16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue,
n16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse,
n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75
BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_left,
BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_right,
BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12
BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_left,
BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_right,
BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e
tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e
result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- n16_MUX_uxn_opcodes_h_l798_c7_ff1e
n16_MUX_uxn_opcodes_h_l798_c7_ff1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond,
n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue,
n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse,
n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518
BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_left,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_right,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output);

-- tmp16_MUX_uxn_opcodes_h_l801_c7_665a
tmp16_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l801_c7_665a_cond,
tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a
result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_cond,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- n16_MUX_uxn_opcodes_h_l801_c7_665a
n16_MUX_uxn_opcodes_h_l801_c7_665a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l801_c7_665a_cond,
n16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue,
n16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse,
n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5
BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l806_c7_b835
tmp16_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l806_c7_b835_cond,
tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_cond,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- n16_MUX_uxn_opcodes_h_l806_c7_b835
n16_MUX_uxn_opcodes_h_l806_c7_b835 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l806_c7_b835_cond,
n16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue,
n16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse,
n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1
BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_left,
BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_right,
BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l809_c7_5808
tmp16_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l809_c7_5808_cond,
tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808
result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808
result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808
result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808
result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808
result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808
result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_cond,
result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- n16_MUX_uxn_opcodes_h_l809_c7_5808
n16_MUX_uxn_opcodes_h_l809_c7_5808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l809_c7_5808_cond,
n16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue,
n16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse,
n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63
BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_left,
BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_right,
BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc
BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_left,
BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_right,
BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3
BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_left,
BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_right,
BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l814_c32_d560
BIN_OP_GT_uxn_opcodes_h_l814_c32_d560 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_left,
BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_right,
BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output);

-- MUX_uxn_opcodes_h_l814_c32_e0b0
MUX_uxn_opcodes_h_l814_c32_e0b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l814_c32_e0b0_cond,
MUX_uxn_opcodes_h_l814_c32_e0b0_iftrue,
MUX_uxn_opcodes_h_l814_c32_e0b0_iffalse,
MUX_uxn_opcodes_h_l814_c32_e0b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39
BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282
result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_cond,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95
BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c
result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_cond,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l824_c34_b271
CONST_SR_8_uxn_opcodes_h_l824_c34_b271 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l824_c34_b271_x,
CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a
BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a
CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output,
 tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output,
 tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output,
 tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output,
 tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output,
 tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output,
 tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output,
 tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output,
 BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output,
 MUX_uxn_opcodes_h_l814_c32_e0b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output,
 CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l780_c3_fd60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_3bc3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_dbb1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l792_c3_3870 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l796_c3_8aca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_9132 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_3042 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_3393 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_6d90 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l820_c24_e478_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l823_c3_079a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l824_c34_b271_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l824_c24_9e7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l787_l810_l795_l802_DUPLICATE_dc52_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l822_l809_DUPLICATE_db16_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l831_l773_DUPLICATE_7016_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_3bc3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_3bc3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_3042 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_3042;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_dbb1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_dbb1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_9132 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_9132;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l792_c3_3870 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l792_c3_3870;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_3393 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_3393;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l780_c3_fd60 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l780_c3_fd60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_6d90 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_6d90;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l796_c3_8aca := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l796_c3_8aca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l823_c3_079a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l823_c3_079a;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l824_c34_b271_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_3862] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l791_c11_8899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_left;
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output := BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l783_c11_51b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_67d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l820_c24_e478] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l820_c24_e478_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l787_l810_l795_l802_DUPLICATE_dc52 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l787_l810_l795_l802_DUPLICATE_dc52_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c6_b1cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l798_c11_fd12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_left;
     BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output := BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_437f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_0a39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l814_c32_5ec3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_left;
     BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output := BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l809_c11_90b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l822_l809_DUPLICATE_db16 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l822_l809_DUPLICATE_db16_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l824_c34_b271] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l824_c34_b271_x <= VAR_CONST_SR_8_uxn_opcodes_h_l824_c34_b271_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output := CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l801_c11_f518] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_left;
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output := BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_eb95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_366a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_left := VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_5ec3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c6_b1cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_51b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_3862_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_8899_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_437f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_fd12_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_f518_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_67d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l809_c11_90b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_0a39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_eb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_366a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l787_l810_l795_l802_DUPLICATE_dc52_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l787_l810_l795_l802_DUPLICATE_dc52_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l787_l810_l795_l802_DUPLICATE_dc52_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l820_c24_e478_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_1879_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l822_l791_l816_l786_l809_l783_l806_l801_l798_l826_DUPLICATE_c474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l791_l816_l786_l783_l806_l777_l801_l798_DUPLICATE_b8a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l794_l791_l786_l809_l783_l806_l801_l798_DUPLICATE_e5b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_l826_DUPLICATE_e05c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l822_l809_DUPLICATE_db16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l822_l809_DUPLICATE_db16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l822_l791_l786_l809_l783_l806_l777_l801_l798_DUPLICATE_cbe1_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l777_c1_0800] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_9282] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_ad13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l824_c24_9e7e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l824_c24_9e7e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l824_c34_b271_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l814_c32_d560] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_left;
     BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output := BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_ad13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_c49c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l795_c3_1e75] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_left;
     BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output := BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l810_c3_5e63] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_left;
     BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output := BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_d560_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_1e75_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l810_c3_5e63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l824_c24_9e7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l803_l788_DUPLICATE_d53a_return_output;
     VAR_printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l777_c1_0800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_ad13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_9282_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_ad13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_c49c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_9282] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output;

     -- t16_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     t16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     t16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output := t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- printf_uxn_opcodes_h_l778_c3_fc80[uxn_opcodes_h_l778_c3_fc80] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l778_c3_fc80_uxn_opcodes_h_l778_c3_fc80_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_XOR[uxn_opcodes_h_l811_c11_9bfc] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_left;
     BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output := BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_c49c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;

     -- n16_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     n16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     n16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output := n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l822_c7_c49c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output := result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- MUX[uxn_opcodes_h_l814_c32_e0b0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l814_c32_e0b0_cond <= VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_cond;
     MUX_uxn_opcodes_h_l814_c32_e0b0_iftrue <= VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_iftrue;
     MUX_uxn_opcodes_h_l814_c32_e0b0_iffalse <= VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_return_output := MUX_uxn_opcodes_h_l814_c32_e0b0_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l811_c11_9bfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue := VAR_MUX_uxn_opcodes_h_l814_c32_e0b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_n16_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_9282_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_c49c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_t16_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     -- t16_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     t16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     t16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output := t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- n16_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     n16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     n16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output := n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_9282] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output := tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l816_c7_9282] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_cond;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output := result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_9282] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_9282_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_9282_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_9282_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_t16_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     -- n16_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     n16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     n16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output := n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- t16_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     t16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     t16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output := t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output := tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l809_c7_5808] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l809_c7_5808_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_t16_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output := tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- n16_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_b835] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- t16_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     t16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     t16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output := t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b835_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_t16_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- n16_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     n16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     n16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output := n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- t16_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     t16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     t16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_665a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_n16_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_665a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output := tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- n16_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     n16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     n16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output := n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l798_c7_ff1e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output := result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_n16_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_ff1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output := tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- n16_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     n16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     n16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output := n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_648a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_n16_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_648a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output := tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- n16_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     n16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     n16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output := n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_f633] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l791_c7_f633_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- n16_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     n16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     n16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output := tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l786_c7_b840] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_cond;
     result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output := result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l786_c7_b840_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l783_c7_6709] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l783_c7_6709_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c2_2c79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l831_l773_DUPLICATE_7016 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l831_l773_DUPLICATE_7016_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c2_2c79_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l777_c2_2c79_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l831_l773_DUPLICATE_7016_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l831_l773_DUPLICATE_7016_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
